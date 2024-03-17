# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    startTime = Time.now
    status, headers, body = @app.call(env)
    endTime = Time.now
    body << "#{endTime - startTime}"
    [status, headers, body]
    # END
  end
end
