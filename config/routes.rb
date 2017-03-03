Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'subjects/index'

  get 'subjects/new'

  get 'subjects/create'

  get 'subjects/edit'

  get 'subjects/update'

  get 'subjects/show'

  get 'subjects/destroy'

  get 'static_pages/calendar'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'messages/new'

  get 'messages/create'

  get 'meetings/index'

  get 'meetings/new'

  get 'meetings/create'

  get 'meetings/edit'

  get 'meetings/update'

  get 'meetings/show'

  get 'lessons/index'

  get 'lessons/new'

  get 'lessons/create'

  get 'lessons/edit'

  get 'lessons/update'

  get 'lessons/show'

  get 'lessons/destroy'

  get 'enrolments/new'

  get 'enrolments/create'

  get 'enrolments/show'

  get 'conversations/index'

  get 'conversations/new'

  get 'conversations/create'

  get 'conversations/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'welcome#index'
end
