Rails.application.routes.draw do

  	devise_for :admins , controllers: { registrations: 'registration'}


	root to: "home#index"
	#Edit
	get 'home/edit' , to: 'home#edit', as: 'edit_home'
	patch 'home', to: 'home#update'


	# Landmarks
	get 'curricula' , to: 'curricula#view'			# Tutti i curriculum
	get 'courses' , to: 'courses#view'				# Tutti i corsi
	get 'services' , to: 'services#view'			# Tutti i servizi
	get 'services/type/:id/' , to: 'services#type'		# Servizi per tipo
	get 'contacts' , to: 'contacts#view', as: 'contact'			# Contatti
	get 'mission' , to: 'mission#view', as: 'mission'				# Mission & Principles
	get 'how_to_get_there' , to: 'how_to_get_there#view', as: 'how_to_get_there'	# Come arrivare
	get 'structures' , to: 'structures#view', as: 'structures'	# Tutte le strutture
	get 'structures/type/:id/' , to: 'structures#type'		# Strutture per tipo
	get 'events' , to: 'events#view'				# Tutti gli eventi
	post 'events/bydate' , to: 'events#bydate'			# Eventi per data
	get 'events/type/:id/' , to: 'events#type'			# Eventi per tipo
	get 'awards' , to: 'awards#view'				# Tutti i riconoscimenti
	get 'history', to: 'history#view', as: 'history'
	get 'alumni', to: 'alumni#view'


	#bureaucracy
	get 'bureaucracy' , to: 'bureaucracy#view', as: 'bureaucracy'	# Burocrazia
	get 'regulation' , to: 'regulation#view',as: 'regulation'	# Regolamento
	get 'costs' , to: 'costs#view', as: 'cost'	# Costi
	get 'bursary' , to: 'bursary#view', as: 'bursary'	# Borse di studio
	#Edit
	get 'bureaucracy/edit' , to: 'bureaucracy#edit', as: 'edit_bureaucracy'
	patch 'bureaucracy', to: 'bureaucracy#update'

	get 'regulation/edit' , to: 'regulation#edit', as: 'edit_regulation'
	patch 'regulation' , to: 'regulation#update'

	get 'costs/edit' , to: 'costs#edit', as: 'edit_cost'
	patch 'costs' , to: 'costs#update'

	get 'bursary/edit' , to: 'bursary#edit', as: 'edit_bursary'
	patch 'bursary' , to: 'bursary#update'

	#Edit for single topic

	get 'mission/edit' , to: 'mission#edit', as: 'edit_mission'
	patch 'mission', to: 'mission#update'

	get 'history/edit' , to: 'history#edit', as: 'edit_history'
	patch 'history', to: 'history#update'

	get 'awards/edit' , to: 'awards#edit', as: 'edit_awards'
	patch 'awards', to: 'awards#update'

	get 'how_to_get_there/edit' , to: 'how_to_get_there#edit', as: 'edit_how_to_get_there'
	patch 'how_to_get_there', to: 'how_to_get_there#update'

	get 'contacts/edit' , to: 'contacts#edit', as: 'edit_contacts'
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
	get 'course/:id/syllabus' , to: 'course#syllabus', as: 'course_syllabus'
	get 'course/:id/timetable' , to: 'course#timetable', as: 'course_timetable'
	get 'course/:id/materials' , to: 'course#materials', as: 'course_materials'
	get 'course/:id/exams' , to: 'course#exams', as: 'course_exams'
	get 'course/:id/curricula' , to: 'course#curricula', as: 'course_curricula'

	#Dirty way for gt!
	get 'courses/courses_by_type/:curriculum_id/:id/syllabus' , to: 'course#syllabus', as: 'courses_type_guided_tour_id_syllabus'
	get 'courses/courses_by_year/:courses_year/:id/syllabus' , to: 'course#syllabus', as: 'courses_year_guided_tour_id_syllabus'
	get 'courses/courses_by_type/:curriculum_id/:id/timetable' , to: 'course#timetable', as: 'courses_type_guided_tour_id_timetable'
	get 'courses/courses_by_year/:courses_year/:id/timetable' , to: 'course#timetable', as: 'courses_year_guided_tour_id_timetable'




	#CRUD courses news
	get 'course/:course_id/news/index' , to: 'news#index', as: 'course_news_index'
	get 'course/:course_id/news/new' , to: 'news#new', as: 'new_course_news'
	post 'course/:course_id/news' , to: 'news#create'
	get 'course/:course_id/news/:id/edit' , to: 'news#edit', as: 'edit_course_new'
	put 'course/:course_id/news/:id' , to: 'news#update'
	delete 'course/:course_id/news/:id' , to: 'news#destroy'
	# News pages
	get 'course/:course_id/news/:id' , to: 'news#view', as: 'course_new'


	#Courses news
	get 'course/:id/news' , to: 'news#news', as: 'course_news'
	delete 'course/:course_id/news/:id' , to: 'news#destroy'

	#Lecture CRUD
	get 'course/:course_id/lectures/index' , to: 'lectures#index', as: 'course_lectures_index'
	get 'course/:course_id/lectures/new' , to: 'lectures#new', as: 'new_course_lecture'
	post 'course/:course_id/lectures' , to: 'lectures#create'
	get  'course/:course_id/lectures/:id/edit' , to: 'lectures#edit', as: 'edit_course_lecture'
	put  'course/:course_id/lectures/:id' , to: 'lectures#update', as: 'update_course_lecture'
	delete 'course/:course_id/lectures/:id' , to: 'lectures#destroy'

	#lecture pages
	get 'course/:course_id/lectures/:id' , to: 'lectures#show', as: 'course_lecture'

	#courses pages
	get 'courses/courses_by_year' , to: 'course#courses_by_year', as: 'courses_by_year'
	get 'courses/courses_by_type' , to: 'course#courses_by_type', as: 'courses_by_type'
	post 'courses/courses_by_year' , to: 'course#courses_by_year'
	post 'courses/courses_by_type' , to: 'course#courses_by_type'
	get 'courses/courses_by_type/:id' , to: 'course#type_guided_tour', as: 'courses_type_guided_tour'
	get 'courses/courses_by_year/:id' , to: 'course#year_guided_tour', as: 'courses_year_guided_tour'
	get 'courses/courses_by_type/:curriculum_id/:id' , to: 'course#type_guided_tour', as: 'courses_type_guided_tour_id'
	get 'courses/courses_by_year/:courses_year/:id' , to: 'course#year_guided_tour', as: 'courses_year_guided_tour_id'


	# Teacher pages
  get 'teacher/index' , to: 'teacher#index', as: 'teacher_index'
	get 'teacher/new' , to: 'teacher#new', as: 'new_teacher'
	get 'teacher/:id' , to: 'teacher#view', as: 'teacher'
	get 'teacher/:id/curriculum' , to: 'teacher#curriculum', as: 'teacher_curriculum'

	#CRUD teacher

	post 'teacher' , to: 'teacher#create'
	get 'teacher/:id/edit' , to: 'teacher#edit', as: 'edit_teacher'
	put 'teacher/:id' , to: 'teacher#update'
	delete 'teacher/:id' , to: 'teacher#destroy'

	# Curriculum new, edit, and destoy
	get 'curriculum/index' , to: 'curriculum#index', as: 'curriculum_index'
	get 'curriculum/new' , to: 'curriculum#new', as: 'new_curriculum'
	get 'curriculum/:curriculum_id/courses/index', to: 'curriculum#manage_courses', as: 'curriculum_courses'
	get 'curriculum/:curriculum_id/courses/list', to: 'curriculum#list_courses_to_add', as: 'list_curriculum_courses'
	put 'curriculum/:curriculum_id/courses/:id', to: 'curriculum#add_course', as: 'add_curriculum_course'
	delete 'curriculum/:curriculum_id/courses/:id', to: 'curriculum#remove_course'
	post 'curriculum' , to: 'curriculum#create'
	get 'curriculum/:id/edit' , to: 'curriculum#edit', as: 'edit_curriculum'
	put 'curriculum/:id' , to: 'curriculum#update'
	delete 'curriculum/:id' , to: 'curriculum#destroy'

	# Curriculum pages
	get 'curriculum/:id' , to: 'curriculum#view', as: 'curriculum_id'
	get 'curriculum/:id/work_opportunity' , to: 'curriculum#work_opportunity', as: 'curriculum_work_opportunity'



	#CRUD Material
	get 'course/:course_id/material/index' , to: 'material#index', as: 'course_material_index'
	get 'course/:course_id/material/new' , to: 'material#new', as: 'new_course_material'
	post 'course/:course_id/material' , to: 'material#create'
	get  'course/:course_id/material/:id/edit' , to: 'material#edit', as: 'edit_course_material'
	put  'course/:course_id/material/:id' , to: 'material#update', as: 'update_course_material'
	delete 'course/:course_id/material/:id' , to: 'material#destroy'
	# Material pages
	get 'course/:course_id/material/:id' , to: 'material#view', as: 'material'

	# Exams pages
  	get 'exam/index' , to: 'exam#index', as: 'exam_index'
	get 'exam/new' , to: 'exam#new', as: 'new_exam'
	get 'exam/:id' , to: 'exam#view', as: 'exam'

	# CRUD exam

	post 'exam' , to: 'exam#create'
	get 'exam/:id/edit' , to: 'exam#edit', as: 'edit_exam'
	put 'exam/:id' , to: 'exam#update'
	delete 'exam/:id' , to: 'exam#destroy'

	# Classrooms pages
	get 'classroom/new' , to: 'classroom#new', as: 'new_classroom'
  get 'classroom/index', to: 'classroom#index', as: 'classroom_index'
	get 'classroom/:id' , to: 'classroom#view' , as: 'classroom'
	get 'classroom/:id/how_to_get_there' , to: 'classroom#how_to_get_there', as: "classroom_htgt"
	get 'classroom/:id/availability' , to: 'classroom#availability', as: 'classroom_avail'
	get 'classroom/:id/services', to: 'classroom#services', as: 'classroom_services'
	get 'classroom/:id/exams', to: 'classroom#exams', as: 'classroom_exams'
	get 'classroom/:id/courses', to: 'classroom#courses', as: 'classroom_courses'

	#CRUD classroom

	post 'classroom' , to: 'classroom#create'
	get 'classroom/:id/edit' , to: 'classroom#edit', as: 'edit_classroom'
	put 'classroom/:id' , to: 'classroom#update'
	delete 'classroom/:id' , to: 'classroom#destroy'

	# Student's services pages
	get 'service/index' , to: 'service#index', as: 'service_index'
	get 'service/:id' , to: 'service#view', as: 'service'
	get 'service/:id/reference' , to: 'service#reference', as: 'service_reference'
	# CRUD services
	get 'services/new' , to: 'service#new', as: 'new_service'
	post 'service' , to: 'service#create'
	get 'service/:id/edit' , to: 'service#edit', as: 'edit_service'
	put 'service/:id' , to: 'service#update'
	delete 'service/:id' , to: 'service#destroy'

	# Structures pages
	get 'structure/index', to: 'structure#index', as: 'structure_index'
	get 'structure/:id' , to: 'structure#view', as: 'structure'
	get 'structure/:id/map' , to: 'structure#map', as: 'structure_map'
	get 'structure/:id/photogallery' , to: 'structure#photogallery', as: 'structure_photos'
	get 'structure/:id/events' , to: 'structure#events', as: 'structure_events'
	get 'structure/:id/services' , to: 'structure#services', as: 'structure_services'
	#CRUD structures
	get 'structures/new' , to: 'structure#new', as: 'new_structure'
	post 'structure' , to: 'structure#create'
	get 'structure/:id/edit' , to: 'structure#edit', as: 'edit_structure'
	put 'structure/:id' , to: 'structure#update'
	delete 'structure/:id' , to: 'structure#destroy'

	# Events pages
	get 'event/index', to: 'event#index', as: 'event_index'
	get 'event/:id' , to: 'event#view', as: 'event'
	get 'event/:id/get_involved' , to: 'event#get_involved', as: 'event_get_involved'
	#CRUD events
	get 'events/new' , to: 'event#new', as: 'new_event'
	post 'event' , to: 'event#create'
	get 'event/:id/edit' , to: 'event#edit', as: 'edit_event'
	put 'event/:id' , to: 'event#update'
	delete 'event/:id' , to: 'event#destroy'

	# School's awards pages
	get 'award/:id' , to: 'award#view', as: 'award'

end
