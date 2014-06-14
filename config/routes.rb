Rails.application.routes.draw do
	
	# Landmarks
	get 'curricula' => 'cirricula#view'			# Tutti i curriculum
	get 'courses' => 'courses#view'				# Tutti i corsi
	get 'services' => 'services#view'			# Tutti i servizi
	get 'contacts' => 'contacts#view'			# Contatti
	get 'mission' => 'mission#view'				# Mission & Principles
	get 'how_to_get_there' => 'how_to_get_there#view'	# Come arrivare
	get 'structures' => 'structures#view'			# Tutte le strutture
	get 'events' => 'events#view'				# Tutti gli eventi
	get 'awards' => 'awards#view'				# Tutti i riconoscimenti
	get 'bureaucracy' => 'bureaucracy#view'			# Burocrazia
	get 'regulation' => 'regulation#view'			# Regolamento
	get 'costs' => 'costs#view'				# Costi
	get 'bursary' => 'bursary#view'				# Borse di studio
	get 'history' => 'history#view'				# Storia della scuola
	get 'alumni' => 'alumni#view'				# Alumni
	
	# Course pages
	get 'course/:id' => 'course#view'
	get 'course/:id/syllabus' => 'course#syllabus'
	get 'course/:id/timetable' => 'course#timetable'
	
	# Teacher pages
	get 'teacher/:id' => 'teacher#view'
	get 'teacher/:id/curriculum' => 'teacher#curriculum'

	# Curriculum pages
	get 'curriculum/:id' => 'curriculum#view'
	get 'curriculum/:id/work_opportunity' => 'curriculum#work_opportunity'

	# News pages
	get 'news/:id' => 'news#view'

	# Material pages
	get 'material/:id' => 'material#view'

	# Exams pages
	get 'exam/:id' => 'exam#view'
	
	# Classrooms pages
	get 'classroom/:id' => 'classroom#view'
	get 'classroom/:id/how_to_get_there' => 'classroom#how_to_get_there'
	get 'classroom/:id/availability' => 'classroom#availability'

	# Student's services pages
	get 'service/:id' => 'service#view'
	get 'service/:id/reference' => 'service#reference'

	# Structures pages
	get 'structure/:id' => 'structure#view'
	get 'structure/:id/map' => 'structure#map'
	get 'structure/:id/photogallery' => 'structure#photogallery'

	# Events pages
	get 'event/:id' => 'event#view'
	get 'event/:id/get_involved' => 'event#get_involved'
	
	# School's awards pages
	get 'awards/:id' => 'awards#view'
	
end
