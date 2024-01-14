class ArticlesController < ApplicationController
  def search
    @active_tab = 'search'
    @articles = if params[:q].present?
                  SearchLog.create(user_ip: request.remote_ip, term: params[:q])

                  Article.search(params[:q])
                else
                  []
                end

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('search_results', partial: 'shared/articles',
                                                                    locals: { articles: @articles })
      end
    end
  end
end
