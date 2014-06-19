Rails.application.routes.draw do
	
	root to: "home#index"

	# Landmarks
	get 'curricula' => 'curricula#view'			# Tutti i curriculum
	get 'courses' => 'courses#view'				# Tutti i corsi
	get 'services' => 'services#view'			# Tutti i servizi
	get 'services/type/:id/' => 'services#type'		# Servizi per tipo
	get 'contacts' => 'contacts#view'			# Contatti
	get 'mission' => 'mission#view'				# Mission & Principles
	get 'how_to_get_there' => 'how_to_get_there#view'	# Come arrivare
	get 'structures' => 'structures#view'			# Tutte le strutture
	get 'structures/type/:id/' => 'structures#type'		# Strutture per tipo
	get 'events' => 'events#view'				# Tutti gli eventi
	post 'events/bydate' => 'events#bydate'			# Eventi per data
	get 'events/type/:id/' => 'events#type'			# Eventi per tipo
	get 'awards' => 'awards#view'				# Tutti i riconoscimenti
	get 'bureaucracy' => 'bureaucracy#view'			# Burocrazia
	get 'regulation' => 'regulation#view'			# Regolamento
	get 'costs' => 'costs#view'				# Costi
	get 'bursary' => 'bursary#view'				# Borse di studio
	get 'history' => 'history#view'				# Storia della scuola
	get 'alumni' => 'alumni#view'				# Alumni
	
	# Course pages
	get 'course/:id', to: 'course#view', as: 'course'
	get 'course/:id/syllabus' => 'course#syllabus', as: 'course_syllabus'
	get 'course/:id/timetable' => 'course#timetable', as: 'course_timetable'
	get 'course/:id/materials' => 'course#materials', as: 'course_materials'
	get 'course/:id/exams' => 'course#exams', as: 'course_exams'
	get 'course/:id/curricula' => 'course#curricula', as: 'couse_curricula'
	get 'course/:id/news' => 'news#news', as: 'course_news'


	#courses pages
	get 'courses/courses_by_year' => 'course#courses_by_year', as: 'courses_by_year'
	get 'courses/courses_by_type' => 'course#courses_by_type', as: 'courses_by_type'
	post 'courses/courses_by_year' => 'course#courses_by_year'
	post 'courses/courses_by_type' => 'course#courses_by_type'

	# Teacher pages
	get 'teacher/:id' => 'teacher#view', as: 'teacher'
	get 'teacher/:id/curriculum' => 'teacher#curriculum', as: 'teacher_curriculum'



	# Curriculum new, edit, and destoy
	get 'curriculum/new' => 'curriculum#new', as: 'new_curriculum'
	post 'curriculum' => 'curriculum#create'
	get 'curriculum/:id/edit' => 'curriculum#edit', as: 'edit_curriculum'
	put 'curriculum/:id' => 'curriculum#update'
	delete 'curriculum/:id' => 'curriculum#destroy'
	get 'curriculum/index' => 'curriculum#index', as: 'curriulum_index'
	# Curriculum pages
	get 'curriculum/:id' => 'curriculum#view', as: 'curriculum_id' 
	get 'curriculum/:id/work_opportunity' => 'curriculum#work_opportunity', as: 'curriculum_work_opportunity'

	# News pages
	get 'news/:id' => 'news#view', as: 'news'

	# Material pages
	get 'material/:id' => 'material#view', as: 'material'

	# Exams pages
	get 'exam/:id' => 'exam#view', as: 'exam'
	
	# Classrooms pages
	get 'classroom/:id' => 'classroom#view' , as: 'classroom'
	get 'classroom/:id/how_to_get_there' => 'classroom#how_to_get_there', as: "classroom_htgt"
	get 'classroom/:id/availability' => 'classroom#availability', as: 'classroom_avail'

	# Student's services pages
	get 'service/:id' => 'service#view', as: 'service'
	get 'service/:id/reference' => 'service#reference', as: 'service_reference'

	# Structures pages
	get 'structure/:id' => 'structure#view', as: 'structure'
	get 'structure/:id/map' => 'structure#map', as: 'structure_map'
	get 'structure/:id/photogallery' => 'structure#photogallery', as: 'structure_photos'
	get 'structure/:id/events' => 'structure#events', as: 'structure_events'
	get 'structure/:id/services' => 'structure#services', as: 'structure_services'

	# Events pages
	get 'event/:id' => 'event#view', as: 'event'
	get 'event/:id/get_involved' => 'event#get_involved', as: 'event_get_involved'
	
	# School's awards pages
	get 'award/:id' => 'award#view', as: 'award'
	
end
