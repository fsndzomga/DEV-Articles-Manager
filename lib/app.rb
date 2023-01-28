require_relative "post_repository"
require_relative "controller"
require_relative "router"

repository = PostRepository.new(File.join(__dir__, 'posts.csv'))

controller = Controller.new(repository)

router = Router.new(controller)

router.run
