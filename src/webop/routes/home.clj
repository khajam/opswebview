(ns webop.routes.home
  (:require [webop.layout :as layout]
            [compojure.core :refer [defroutes GET POST]]
            [ring.util.http-response :refer [ok]]
            [clojure.java.io :as io]
            [webop.db.core :as db]
    		[bouncer.core :as b]
    		[bouncer.validators :as v]
    		[ring.util.response :refer [redirect]]))

(defn validate-location [params]
  (first
    (b/validate
      params
      :person_location_id v/required
      :city_name [v/required [v/min-count 3]]
      :country_name [v/required [v/min-count 3]]
      )))

(defn save-location! [{:keys [params]}]
  (if-let [errors (validate-location params)]
    (-> (redirect "/")
        (assoc :flash (assoc params :errors errors)))
    (do
      (db/add-person-location!
       (assoc params))
      (redirect "/"))))

(defn home-page [{:keys [flash]}]
  (layout/render
    "home.html" 
    (merge {:locations (db/get-all-locations)}
    	(select-keys flash[:person_location_id, :city_name, :country_name :errors]))
    ))

(defn about-page []
  (layout/render "about.html"))

(defroutes home-routes
  (GET "/" request (home-page request))
  (POST "/" request (save-location! request))
  (GET "/about" [] (about-page)))

