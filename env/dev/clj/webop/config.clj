(ns webop.config
  (:require [selmer.parser :as parser]
            [taoensso.timbre :as timbre]
            [webop.dev-middleware :refer [wrap-dev]]))

(def defaults
  {:init
   (fn []
     (parser/cache-off!)
     (timbre/info "\n-=[webop started successfully using the development profile]=-"))
   :middleware wrap-dev})
