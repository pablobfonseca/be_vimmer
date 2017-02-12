%w(
  Insert\ Mode
  Normal\ Mode
  Sub\ Mode
  Visual\ Mode
  Text\ Objects
  Window\ Commands
  Command\ Line\ Mode
  Ex\ Mode
).each do |mode|
  Mode.create(name: mode)
end
