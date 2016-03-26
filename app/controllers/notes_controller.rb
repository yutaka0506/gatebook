class NotesController < ApplicationController
	before_action :set_note, only:[:show,:edit,:update,:destroy]

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
    # binding.pry
    # ↑で動きを止めるrails s で確認できる
  	if @note.save
  		# saveでidを決める
  		redirect_to @note, notice:'投稿が保存されました。'
  		# redirect_to note_path(@note.id)
  	else
  		render :new
  end
  end

  def index
  	@notes = Note.all
  end

  def show
  end

  def edit
  end

  def update
  	if @note.update(note_params)
  		redirect_to @note
  	else
  		render :exit
  	end
  	# redirect_to note_path(@note.id)
  end

  def destroy
    @note.destroy
  	redirect_to notes_path(@note.id)
  end


  private
  def set_note
  	@note = Note.find(params[:id])
  end

  def note_params
  	params.require(:note).permit(:title, :content)
  end

end
