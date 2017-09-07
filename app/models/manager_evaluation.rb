class ManagerEvaluation < ApplicationRecord
  enum evaluation_type: ['aspectos_operacionais','boas_práticas']
end
