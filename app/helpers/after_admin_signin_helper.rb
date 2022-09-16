module AfterAdminSigninHelper
    def red
        redirect_to after_user_signin_index_path
    end
end
