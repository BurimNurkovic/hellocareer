class Admin::ContentBoxesController < AdminController
  def index
    @box = ContentBox.new
    @boxes = ContentBox.all
  end

  def create
    ContentBox.create!(secure_params)
    redirect_to admin_content_boxes_path
  end

  def edit
    @box = ContentBox.find(params[:id])
  end

  def update
    ContentBox.find(params[:id]).update_attributes!(secure_params)
    redirect_to admin_content_boxes_path
  end

  def destroy
    ContentBox.destroy(params[:id])
    redirect_to admin_content_boxes_path
  end

  private

  def secure_params
    params.require(:content_box).permit(:title, :body, :image, :key)
  end
end
