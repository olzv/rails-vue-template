class User::Operation::List < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = ::User.all.reverse_order
  end
end
