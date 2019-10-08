class GistQuestionService

  attr_reader :responce

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @responce = @client.create_gist(gist_params)
  end

  def success?
    @responce[:html_url] && (200..299).include?(@client.last_response.status)
  end

  def default_client
    Octokit::Client.new(access_token: ENV['OCTOKID_TOKEN'])
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