class GistQuestionService

  attr_reader :responce

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || OctokitClient.new
  end

  def call
    @responce = @client.create_gist(gist_params)
  end

  def success?
   (200..299).include?(@client.http_client.last_response.status)
  end

  private

  def gist_params
    {
        description: I18n.t('services.gist_question_service.description', title: @test.title),
        files: {
            'test_guru_question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end