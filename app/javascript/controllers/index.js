// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import ImagePreviewController from "controllers/image_preview_controller"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

application.register("image-preview", ImagePreviewController)
