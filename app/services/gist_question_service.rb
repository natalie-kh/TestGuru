class GistQuestionService

  attr_reader :responce

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || OctokitClient.new
  end

  def call
    @responce = @client.create_gist(gist_params)
    byebug
  end


  def success?
    @client.http_client.last_response.status == 201
  end

  private

  def gist_params
    {
        description: "A question about #{@test.title} from TestGuru",
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