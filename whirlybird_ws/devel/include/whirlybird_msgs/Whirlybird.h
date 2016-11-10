// Generated by gencpp from file whirlybird_msgs/Whirlybird.msg
// DO NOT EDIT!


#ifndef WHIRLYBIRD_MSGS_MESSAGE_WHIRLYBIRD_H
#define WHIRLYBIRD_MSGS_MESSAGE_WHIRLYBIRD_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace whirlybird_msgs
{
template <class ContainerAllocator>
struct Whirlybird_
{
  typedef Whirlybird_<ContainerAllocator> Type;

  Whirlybird_()
    : roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , accel_x(0.0)
    , accel_y(0.0)
    , accel_z(0.0)
    , gyro_x(0.0)
    , gyro_y(0.0)
    , gyro_z(0.0)  {
    }
  Whirlybird_(const ContainerAllocator& _alloc)
    : roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , accel_x(0.0)
    , accel_y(0.0)
    , accel_z(0.0)
    , gyro_x(0.0)
    , gyro_y(0.0)
    , gyro_z(0.0)  {
  (void)_alloc;
    }



   typedef float _roll_type;
  _roll_type roll;

   typedef float _pitch_type;
  _pitch_type pitch;

   typedef float _yaw_type;
  _yaw_type yaw;

   typedef float _accel_x_type;
  _accel_x_type accel_x;

   typedef float _accel_y_type;
  _accel_y_type accel_y;

   typedef float _accel_z_type;
  _accel_z_type accel_z;

   typedef float _gyro_x_type;
  _gyro_x_type gyro_x;

   typedef float _gyro_y_type;
  _gyro_y_type gyro_y;

   typedef float _gyro_z_type;
  _gyro_z_type gyro_z;




  typedef boost::shared_ptr< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> const> ConstPtr;

}; // struct Whirlybird_

typedef ::whirlybird_msgs::Whirlybird_<std::allocator<void> > Whirlybird;

typedef boost::shared_ptr< ::whirlybird_msgs::Whirlybird > WhirlybirdPtr;
typedef boost::shared_ptr< ::whirlybird_msgs::Whirlybird const> WhirlybirdConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::whirlybird_msgs::Whirlybird_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace whirlybird_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'whirlybird_msgs': ['/home/mark/Dropbox/controlbook/whirlybird/pythonCode/whirlybird_ws/src/whirlybird_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a058255bc42da20a874152da8fe20c12";
  }

  static const char* value(const ::whirlybird_msgs::Whirlybird_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa058255bc42da20aULL;
  static const uint64_t static_value2 = 0x874152da8fe20c12ULL;
};

template<class ContainerAllocator>
struct DataType< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
{
  static const char* value()
  {
    return "whirlybird_msgs/Whirlybird";
  }

  static const char* value(const ::whirlybird_msgs::Whirlybird_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Whirlybird.msg\n\
\n\
float32 roll\n\
float32 pitch\n\
float32 yaw\n\
\n\
float32 accel_x\n\
float32 accel_y\n\
float32 accel_z\n\
\n\
float32 gyro_x\n\
float32 gyro_y\n\
float32 gyro_z\n\
";
  }

  static const char* value(const ::whirlybird_msgs::Whirlybird_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.roll);
      stream.next(m.pitch);
      stream.next(m.yaw);
      stream.next(m.accel_x);
      stream.next(m.accel_y);
      stream.next(m.accel_z);
      stream.next(m.gyro_x);
      stream.next(m.gyro_y);
      stream.next(m.gyro_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Whirlybird_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::whirlybird_msgs::Whirlybird_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::whirlybird_msgs::Whirlybird_<ContainerAllocator>& v)
  {
    s << indent << "roll: ";
    Printer<float>::stream(s, indent + "  ", v.roll);
    s << indent << "pitch: ";
    Printer<float>::stream(s, indent + "  ", v.pitch);
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
    s << indent << "accel_x: ";
    Printer<float>::stream(s, indent + "  ", v.accel_x);
    s << indent << "accel_y: ";
    Printer<float>::stream(s, indent + "  ", v.accel_y);
    s << indent << "accel_z: ";
    Printer<float>::stream(s, indent + "  ", v.accel_z);
    s << indent << "gyro_x: ";
    Printer<float>::stream(s, indent + "  ", v.gyro_x);
    s << indent << "gyro_y: ";
    Printer<float>::stream(s, indent + "  ", v.gyro_y);
    s << indent << "gyro_z: ";
    Printer<float>::stream(s, indent + "  ", v.gyro_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WHIRLYBIRD_MSGS_MESSAGE_WHIRLYBIRD_H