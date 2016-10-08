class Admin::TestimonialsController < AdminController
  def index
    @testimonial = Testimonial.new
    @testimonials = Testimonial.all
  end

  def create
    Testimonial.create!(secure_params)
    redirect_to admin_testimonials_path
  end

  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  def update
    Testimonial.find(params[:id]).update_attributes!(secure_params)
    redirect_to admin_testimonials_path
  end

  def destroy
    Testimonial.destroy(params[:id])
    redirect_to admin_testimonials_path
  end

  private

  def secure_params
    params.require(:testimonial).permit(:author, :text, :picture)
  end
end
