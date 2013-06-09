class PatchedOpenStruct

  def keep_fields(*fields)
    self.class.new.tap do |pos|
      fields.each { |field| pos.send("#{field}=", self.send(field)) }
    end
  end

  def to_hash
    self.methods(false).grep(/[^=]$/).each_with_object({}) do |method, hash|
      hash[method] = self.send(method)
    end
  end
end