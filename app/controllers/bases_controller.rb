class BasesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  
  def new
    @base = Base.new
  end
  
  def index
    @bases = Base.paginate(page: params[:page], per_page: 3)
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = '拠点情報追加に成功しました。'
      redirect_to bases_path
    else
      flash[:danger] = '拠点情報追加に失敗しました。'
      redirect_to bases_path
    end
  end
  
  def edit
    @base = Base.find(params[:id])
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(base_params)
      flash[:success] = "拠点情報を修正しました。"
      redirect_to bases_path
    else
      flash[:danger] = '拠点情報修正に失敗しました。'
      redirect_to bases_path
    end
  end
  
  def edit_system_info
  end
  
  private
  
    def base_params
      params.require(:base).permit(:base_name, :attendance_type)
    end
    
end
