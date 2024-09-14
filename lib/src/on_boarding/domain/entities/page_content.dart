import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  final String image;
  final String title;
  final String description;

  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  const PageContent.first()
      : this(
            image: MediaRes.onBordingContent1,
            title: 'Book your desired vehicle in real-time!',
            description:
                "Easily check vehicle availability and book with just a few clicks. Get real-time updates on available vehicles.");

  const PageContent.second()
      : this(
            image: MediaRes.onBordingContent2,
            title: 'Manage your reservations with ease!',
            description:
                "Quickly review your reservations and make changes or cancellations whenever needed. Managing your car rental is now easier than ever");

  const PageContent.third()
      : this(
            image: MediaRes.onBordingContent3,
            title: 'Never miss a return deadline!',
            description:
                "Receive notifications for your return schedule and adjust the timing effortlessly. Returning your vehicle on time is now simpler");

  @override
  List<Object?> get props => [image, title, description];
}
