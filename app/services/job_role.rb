class JobRole
  attr_reader :role

  def initialize(role)
    @role = role
  end

  def self.parse(role)
    return new(role) if %w[contract full-time part-time].include?(role)

    Grape::Types::InvalidValue.new('Unsupported role')
  end
end