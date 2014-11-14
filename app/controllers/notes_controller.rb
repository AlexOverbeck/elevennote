class NotesController < ApplicationController
  before_action :authorize_user
  before_action :load_notes
  before_action :find_note, only: [:show, :update]

  def show
    render :edit
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    set_flash_for @note.save(note_params)
    render_or_redirect
  end

  def update
    set_flash_for @note.update(note_params)
    render :edit
  end

  def destroy
    set_flash_for @note.destroy
    redirect_to new_note_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body_html)
  end

  def find_note
    @note = Note.find params[:id]
  end

  def set_flash_for(action_result)
    if action_result
      flash.notice = t("note.flash.save.success")
    else
      # flash.now = t("#{controller_name}.flash.#{action_name}.failure")
      flash.now = t("note.flash.save.failure")
    end
  end

  def render_or_redirect
    @note.errors.any? ? render(:edit) : redirect_to(@note)
  end

  def load_notes
    @notes = Note.all
  end
end
