module Api
    module V1
        class PostsController < ActionController::API
            def index #get
                @posts=Post.order('updated_at DESC')
                if @posts
                    render json: @posts
                                            
                 else
                  
                 render json: @posts.erros, status: :unprocessable_entity
                                       
                    
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
                
            end

            def update #put|pacth/param
                
            end

            def destroy #delete/param
              
            end
            

          
        end
    end
end