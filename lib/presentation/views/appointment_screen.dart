import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedFilter = 0;
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            const SizedBox(height: 20),
            _buildTitle(),
            const SizedBox(height: 16),
            _buildFilters(),
            const SizedBox(height: 20),
            _buildAppointmentCard(
              title: "Neurosurgery",
              subtitleTop: "12 Doctors available",
              subtitleBottom:
                  "Specialist Surgery Doctor\nSchedule your appointment",
              time: "10:50 - 02:40",
            ),
            const SizedBox(height: 16),
            _buildAppointmentCard(
              title: "Vascular Surgery",
              subtitleTop: "18 Doctors available",
              subtitleBottom:
                  "Specialist Surgery Doctor\nSchedule your appointment",
              time: "09:30 - 04:30",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.person, size: 28, color: Colors.blue),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Good Morning 👋", style: TextStyle(color: Colors.grey)),
            Text(
              "User Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return const Text(
      "Make an Appointment",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFilters() {
    final items = ["All", "Specialist", "Surgery", "Treatment"];
    return Wrap(
      spacing: 8,
      children: [
        for (int i = 0; i < items.length; i++)
          ChoiceChip(
            label: Text(items[i]),
            selected: _selectedFilter == i,
            onSelected: (_) => setState(() => _selectedFilter = i),
            backgroundColor: Colors.transparent,
            selectedColor: Colors.transparent,
            labelStyle: TextStyle(
              color: _selectedFilter == i ? Colors.blue : Colors.black,
              fontWeight: _selectedFilter == i
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
      ],
    );
  }

  Widget _buildAppointmentCard({
    required String title,
    required String subtitleTop,
    required String subtitleBottom,
    required String time,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            subtitleTop,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            subtitleBottom,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                child: const Text("Book Now"),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
