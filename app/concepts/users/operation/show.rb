class Users::Show < Trailblazer::Operation
  step :model!

  def model!(ctx, params:, **)
    ctx[:model] = User.find(params[:id])
  end
end
