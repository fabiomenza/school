Rails.application.routes.draw do

  	devise_for :admins , :controllers => { :registrations => 'registration'}
  	
	
	root to: "home#index"
	#Edit
	get 'home/edit' => 'home#edit', as: 'edit_home'
	patch 'home', to: 'home#update'


	# Landmarks
	get 'curricula' => 'curricula#view'			# Tutti i curriculum
	get 'courses' => 'courses#view'				# Tutti i corsi
	get 'services' => 'services#view'			# Tutti i servizi
	get 'services/type/:id/' => 'services#type'		# Servizi per tipo
	get 'contacts' => 'contacts#view', as: 'contact'			# Contatti
	get 'mission' => 'mission#view', as: 'mission'				# Mission & Principles
	get 'how_to_get_there' => 'how_to_get_there#view', as: 'how_to_get_there'	# Come arrivare
	get 'structures' => 'structures#view', as: 'structures'	# Tutte le strutture
	get 'structures/type/:id/' => 'structures#type'		# Strutture per tipo
	get 'events' => 'events#view'				# Tutti gli eventi
	post 'events/bydate' => 'events#bydate'			# Eventi per data
	get 'events/type/:id/' => 'events#type'			# Eventi per tipo
	get 'awards' => 'awards#view'				# Tutti i riconoscimenti
	get 'history', to: 'history#view', as: 'history'
	get 'alumni', to: 'alumni#view'
	
	
	#bureaucracy
	get 'bureaucracy' => 'bureaucracy#view', as: 'bureaucracy'	# Burocrazia
	get 'regulation' => 'regulation#view',as: 'regulation'	# Regolamento
	get 'costs' => 'costs#view', as: 'cost'	# Costi
	get 'bursary' => 'bursary#view', as: 'bursary'	# Borse di studio
	#Edit
	get 'bureaucracy/edit' => 'bureaucracy#edit', as: 'edit_bureaucracy'
	patch 'bureaucracy', to: 'bureaucracy#update'

	get 'regulation/edit' => 'regulation#edit', as: 'edit_regulation'
	patch 'regulation' => 'regulation#update'

	get 'costs/edit' => 'costs#edit', as: 'edit_cost'
	patch 'costs' => 'costs#update'

	get 'bursary/edit' => 'bursary#edit', as: 'edit_bursary'
	patch 'bursary' => 'bursary#update'

	#Edit for single topic
		
	get 'mission/edit' => 'mission#edit', as: 'edit_mission'
	patch 'mission', to: 'mission#update'
	
	get 'history/edit' => 'history#edit', as: 'edit_history'
	patch 'history', to: 'history#update'
	
	get 'awards/edit' => 'awards#edit', as: 'edit_awards'
	patch 'awards', to: 'awards#update'

	get 'how_to_get_there/edit' => 'how_to_get_there#edit', as: 'edit_how_to_get_there'
	patch 'how_to_get_there', to: 'how_to_get_there#update'

	get 'contacts/edit' => 'contacts#edit', as: 'edit_contacts'
	patch 'contacts', to: 'contacts#update'

	# CRUD Course pages
	get 'courses/index', to: 'course#index', as: 'course_index'
	get 'courses/new', to: 'course#new', as: 'new_course'
	post 'courses', to: 'course#create'
	get 'course/:id', to: 'course#view', as: 'course'
	get 'course/:id/edit', to: 'course#edit', as: 'course_edit'
	put 'course/:id', to: 'course#update'
	delete 'course/:id', to: 'course#destroy'



	#Courses page
	get 'course/:id/syllabus' => 'course#syllabus', as: 'course_syllabus'
	get 'course/:id/timetable' => 'course#timetable', as: 'course_timetable'
	get 'course/:id/materials' => 'course#materials', as: 'course_materials'
	get 'course/:id/exams' => 'course#exams', as: 'course_exams'
	get 'course/:id/curricula' => 'course#curricula', as: 'course_curricula'

	#Dirty way for gt!
	get 'courses/courses_by_type/:curriculum_id/:id/syllabus' => 'course#syllabus', as: 'courses_type_guided_tour_id_syllabus'
	get 'courses/courses_by_year/:courses_year/:id/syllabus' => 'course#syllabus', as: 'courses_year_guided_tour_id_syllabus'
	get 'courses/courses_by_type/:curriculum_id/:id/timetable' => 'course#timetable', as: 'courses_type_guided_tour_id_timetable'
	get 'courses/courses_by_year/:courses_year/:id/timetable' => 'course#timetable', as: 'courses_year_guided_tour_id_timetable'



	
	#CRUD courses news
	get 'course/:course_id/news/index' => 'news#index', as: 'course_news_index'
	get 'course/:course_id/news/new' => 'news#new', as: 'new_course_news'
	post 'course/:course_id/news' => 'news#create'
	get 'course/:course_id/news/:id/edit' => 'news#edit', as: 'edit_course_new'
	put 'course/:course_id/news/:id' => 'news#update'
	delete 'course/:course_id/news/:id' => 'news#destroy'
	# News pages
	get 'course/:course_id/news/:id' => 'news#view', as: 'course_new'


	#Courses news
	get 'course/:id/news' => 'news#news', as: 'course_news'
	delete 'course/:course_id/news/:id' => 'news#destroy'

	#Lecture CRUD
	get 'course/:course_id/lectures/index' => 'lectures#index', as: 'course_lectures_index'
	get 'course/:course_id/lectures/new' => 'lectures#new', as: 'new_course_lecture'
	post 'course/:course_id/lectures' => 'lectures#create'
	get  'course/:course_id/lectures/:id/edit' => 'lectures#edit', as: 'edit_course_lecture'
	put  'course/:course_id/lectures/:id' => 'lectures#update', as: 'update_course_lecture'
	delete 'course/:course_id/lectures/:id' => 'lectures#destroy'

	#lecture pages
	get 'course/:course_id/lectures/:id' => 'lectures#show', as: 'course_lecture'

	#courses pages
	get 'courses/courses_by_year' => 'course#courses_by_year', as: 'courses_by_year'
	get 'courses/courses_by_type' => 'course#courses_by_type', as: 'courses_by_type'
	post 'courses/courses_by_year' => 'course#courses_by_year'
	post 'courses/courses_by_type' => 'course#courses_by_type'
	get 'courses/courses_by_type/:id' => 'course#type_guided_tour', as: 'courses_type_guided_tour'
	get 'courses/courses_by_year/:id' => 'course#year_guided_tour', as: 'courses_year_guided_tour'
	get 'courses/courses_by_type/:curriculum_id/:id' => 'course#type_guided_tour', as: 'courses_type_guided_tour_id'
	get 'courses/courses_by_year/:courses_year/:id' => 'course#year_guided_tour', as: 'courses_year_guided_tour_id'


	# Teacher pages
	get 'teacher/new' => 'teacher#new', as: 'new_teacher'
	get 'teacher/:id' => 'teacher#view', as: 'teacher'
	get 'teacher/:id/curriculum' => 'teacher#curriculum', as: 'teacher_curriculum'

	#CRUD teacher
	
	post 'teacher' => 'teacher#create'
	get 'teacher/:id/edit' => 'teacher#edit', as: 'edit_teacher'
	put 'teacher/:id' => 'teacher#update'
	delete 'teacher/:id' => 'teacher#destroy'

	# Curriculum new, edit, and destoy
	get 'curriculum/index' => 'curriculum#index', as: 'curriculum_index'
	get 'curriculum/new' => 'curriculum#new', as: 'new_curriculum'
	get 'curriculum/:curriculum_id/courses/index', to: 'curriculum#manage_courses', as: 'curriculum_courses'
	get 'curriculum/:curriculum_id/courses/list', to: 'curriculum#list_courses_to_add', as: 'list_curriculum_courses'
	put 'curriculum/:curriculum_id/courses/:id', to: 'curriculum#add_course', as: 'add_curriculum_course'
	delete 'curriculum/:curriculum_id/courses/:id', to: 'curriculum#remove_course'
	post 'curriculum' => 'curriculum#create'
	get 'curriculum/:id/edit' => 'curriculum#edit', as: 'edit_curriculum'
	put 'curriculum/:id' => 'curriculum#update'
	delete 'curriculum/:id' => 'curriculum#destroy'

	# Curriculum pages
	get 'curriculum/:id' => 'curriculum#view', as: 'curriculum_id'
	get 'curriculum/:id/work_opportunity' => 'curriculum#work_opportunity', as: 'curriculum_work_opportunity'

	

	#CRUD Material
	get 'course/:course_id/material/index' => 'material#index', as: 'course_material_index'
	get 'course/:course_id/material/new' => 'material#new', as: 'new_course_material'
	post 'course/:course_id/material' => 'material#create'
	get  'course/:course_id/material/:id/edit' => 'material#edit', as: 'edit_course_material'
	put  'course/:course_id/material/:id' => 'material#update', as: 'update_course_material'
	delete 'course/:course_id/material/:id' => 'material#destroy'
	# Material pages
	get 'course/:course_id/material/:id' => 'material#view', as: 'material'

	# Exams pages
	get 'exam/new' => 'exam#new', as: 'new_exam'
	get 'exam/:id' => 'exam#view', as: 'exam'

	# CRUD exam
	
	post 'exam' => 'exam#create'
	get 'exam/:id/edit' => 'exam#edit', as: 'edit_exam'
	put 'exam/:id' => 'exam#update'
	delete 'exam/:id' => 'exam#destroy'

	# Classrooms pages
	get 'classroom/new' => 'classroom#new', as: 'new_classroom'

	get 'classroom/:id' => 'classroom#view' , as: 'classroom'
	get 'classroom/:id/how_to_get_there' => 'classroom#how_to_get_there', as: "classroom_htgt"
	get 'classroom/:id/availability' => 'classroom#availability', as: 'classroom_avail'
	get 'classroom/:id/services', to: 'classroom#services', as: 'classroom_services'
	get 'classroom/:id/exams', to: 'classroom#exams', as: 'classroom_exams'
	get 'classroom/:id/courses', to: 'classroom#courses', as: 'classroom_courses'

	#CRUD classroom
	
	post 'classroom' => 'classroom#create'
	get 'classroom/:id/edit' => 'classroom#edit', as: 'edit_classroom'
	put 'classroom/:id' => 'classroom#update'
	delete 'classroom/:id' => 'classroom#destroy'

	# Student's services pages
	get 'service/index' => 'service#index', as: 'service_index'
	get 'service/:id' => 'service#view', as: 'service'
	get 'service/:id/reference' => 'service#reference', as: 'service_reference'
	# CRUD services
	get 'services/new' => 'service#new', as: 'new_service'
	post 'service' => 'service#create'
	get 'service/:id/edit' => 'service#edit', as: 'edit_service'
	put 'service/:id' => 'service#update'
	delete 'service/:id' => 'service#destroy'

	# Structures pages
	get 'structure/index', to: 'structure#index', as: 'structure_index'
	get 'structure/:id' => 'structure#view', as: 'structure'
	get 'structure/:id/map' => 'structure#map', as: 'structure_map'
	get 'structure/:id/photogallery' => 'structure#photogallery', as: 'structure_photos'
	get 'structure/:id/events' => 'structure#events', as: 'structure_events'
	get 'structure/:id/services' => 'structure#services', as: 'structure_services'
	#CRUD structures
	get 'structures/new' => 'structure#new', as: 'new_structure'
	post 'structure' => 'structure#create'
	get 'structure/:id/edit' => 'structure#edit', as: 'edit_structure'
	put 'structure/:id' => 'structure#update'
	delete 'structure/:id' => 'structure#destroy'

	# Events pages
	get 'event/index', to: 'event#index', as: 'event_index'
	get 'event/:id' => 'event#view', as: 'event'
	get 'event/:id/get_involved' => 'event#get_involved', as: 'event_get_involved'
	#CRUD events
	get 'events/new' => 'event#new', as: 'new_event'
	post 'event' => 'event#create'
	get 'event/:id/edit' => 'event#edit', as: 'edit_event'
	put 'event/:id' => 'event#update'
	delete 'event/:id' => 'event#destroy'

	# School's awards pages
	get 'award/:id' => 'award#view', as: 'award'

end
