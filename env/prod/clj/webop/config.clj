(ns webop.config
  (:require [taoensso.timbre :as timbre]))

(def defaults
  {:init
   (fn []
     (timbre/info "\n-=[webop started successfully]=-"))
   :middleware identity})
