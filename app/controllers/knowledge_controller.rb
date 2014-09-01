class KnowledgeController < ApplicationController
  include AutoHtml
  def index
    @knowledge_page = @current_language.knowledge_page || KnowledgePage.new
  end

  def research
    @resource = @current_language.research_page || ResearchPage.new
    @list = @current_language.researches.rank(:row_order) || [Research.new]
  end

  def expert
  end

  def groups
  end

  def ouiki
  end

  def cocreation
    @cocreation_page = @current_language.cocreation_page || CocreationPage.new
    @cocreations = @current_language.cocreations
  end
end
