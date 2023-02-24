class Service
  protected

  def success(data = nil)
    Result.new(true, data: data)
  end

  def error(code: nil)
    Result.new(false, error_code: code)
  end
end