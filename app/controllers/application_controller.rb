class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  #デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  
  def after_sign_in_path_for(resource)
    # resourceにする意味はよくわからない
    # if文だとうまくいかないのでcase-whenを使っています
    case resource
      when Admin
        admins_path
      when User
       root_path
    end
  end

  def after_sign_up_path_for(resource)
    case resource
      when Admin
        admins_path
      when User
       root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                       :last_name,
                                                       :first_kana,
                                                       :last_kana,
                                                       :email,
                                                       :postal_code,
                                                       :address,
                                                       :telephone_number ])
    #sign_upの際にnameのデータ操作を許可するために追加したカラム。
  end
end
