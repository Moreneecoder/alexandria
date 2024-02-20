# app/presenters/base_presenter.rb
class BasePresenter
  # Define a class level instance variable
  @build_attributes = []
  @relations = []
  @sort_attributes = []
  @filter_attributes = []

  # Open the door to class methods
  class << self
    # Define an accessor for the class level instance
    # variable we created above
    attr_accessor :build_attributes, :relations, :sort_attributes,
    :filter_attributes

    # Create the actual class method that will
    # be used in the subclasses
    # We use the splash operation '*' to get all
    # the arguments passed in an array
    def build_with(*args)
      @build_attributes = args.map(&:to_s)
    end

    def related_to(*args)
        @relations = args.map(&:to_s)
      end
  
      def sort_by(*args)
        @sort_attributes = args.map(&:to_s)
      end
  
      def filter_by(*args)
        @filter_attributes = args.map(&:to_s)
      end
  end

  attr_accessor :object, :params, :data
  
  def initialize(object, params, options = {})
    @object = object
    @params = params
    @options = options
    @data = HashWithIndifferentAccess.new
  end
  
  def as_json(*)
    @data
  end
  
end

### BELOW IS THE BasePresenter self CLASS, RE-WRITTEN META-PROGRAMMATICALLY

# class BasePresenter
#     CLASS_ATTRIBUTES = {
#       build_with: :build_attributes,
#       related_to: :relations,
#       sort_by: :sort_attributes,
#       filter_by: :filter_attributes
#     }
  
#     CLASS_ATTRIBUTES.each { |k, v| instance_variable_set("@#{v}", []) }
  
#     class << self
#       attr_accessor *CLASS_ATTRIBUTES.values
  
#       CLASS_ATTRIBUTES.each do |k, v|
#         define_method k do |*args|
#           instance_variable_set("@#{v}", args.map(&:to_s))
#         end
#       end
#     end
  
#     # Hidden Code
#     # accessors, initialize, ...
#   end
  