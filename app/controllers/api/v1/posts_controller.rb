module Api
    module V1
        class PostsController < ActionController::API
            include ActionController::HttpAuthentication::Token::ControllerMethods

            before_action :authenticate , only: [:create, :update, :destory]
            def index #get
                @posts=Post.order('updated_at DESC')
                if @posts
                    render json: @posts                                            
                 else                  
                 render json: @posts.errors, status: :unprocessable_entity                                       
                    
                end
                
            end

            def show #get/param
                @post=Post.find(params[:id])
                if @post
                    render json: @post
                                            
                 else
                        
                    render json: @post.erros, status: :unprocessable_entity
                                       
                end  
            end

            def create #post/param
                @post=@user.posts.new (post_params) 
                if @post.save
                    render json: @post, status: :created
                else
                    render json: @post.errors, status: :unprocessable_entity
                end

            end

            def update #put|pacth/param
                
            end

            def destroy #delete/param
              
            end
            
private 
def post_params
    params.require(:post).permit(:title,:body)
end
def authenticate
authenticate_or_request_with_http_token do|token, options|
@user=User.find_by(toke: token)
end
end
          
        end
    end
end