

module Question

  SINGULAR_CATEGORIES = {
    "position"                => "Poziția pentru care aplici",
    "short_description"       => "Pe scurt despre tine"
  }

  PLURAL_CATEGORIES = {
    "job"                     => "Job",
    "internship"              => "Stagiu de practică",
    "volunteering"            => "Voluntariat",
    "language_competence"     => "Competențe lingvistice",
    "professional_competence" => "Competențe profesionale",
    "personal_efficiency"     => "Eficiența ta personală",
    "professional_school"     => "Școala Profesională",
    "college"                 => "Colegiu",
    "bachelor"                => "Facultate",
    "master"                  => "Masterat",
    "doctorate"               => "Doctorat",
    "competition"             => "Concursuri",
    "course"                  => "Cursuri și programe de training",
    "qualification"           => "Calificări, certificări",
    "hobby"                   => "Hobby-uri"
  }


  CATEGORIES = SINGULAR_CATEGORIES.merge(PLURAL_CATEGORIES)
end

# Question::CATEGORIES.keys.each do |cat|
#   autoload "AnswerSet::#{cat.camelize}", 'answer_set/base'
# end

