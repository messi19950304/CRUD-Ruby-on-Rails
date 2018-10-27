module Api
    module V1
        class UsersController < ActionController::API
        def index #get
            @users=User.order('updated_at DESC')
            if @users
                render json:@users
                                         
            else
                    
             render json:@users.erros, status: :unprocessable_entity
                
                
            end
            

        end

        def show #get/param
            @users=User.find(params[:id])
            if @users
                render json:@users
                                         
            else
                    
             render json:@users.erros, status: :unprocessable_entity
                
                
            end
        end

        def create #post/param
            @user= User.new(user_params)
            if @user.save

                render json: @user, status: :created
            else
                render json:@user.errors, status: :unprocessable_entity

            end
            
        end

        def update #put|pacth/param
            @user= User.find(params[:id])
             if @user.update  user_params

                render json: @user, status: :update
              else
                render json: @user.errors, status: :unprocessable_entity
               
            end
        end

        def destroy #delete/param
            @user= User.find(params[:id])
             if @user.destroy  
                render json: @user,status: :delete
              else
                render json: @user.errors, status: :unprocessable_entity
               
            end  
        end
private
def user_params
 params.require(:user).permit(:name)
end


    end

    end
end