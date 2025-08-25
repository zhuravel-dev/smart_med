import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            _buildSearchField(),
            const SizedBox(height: 20),
            _buildMedicalChecks(),
            const SizedBox(height: 24),
            _buildDoctorSpecialityHeader(),
            const SizedBox(height: 16),
            _buildSpecialityGrid(),
            const SizedBox(height: 24),
            _buildTopDoctorsHeader(),
            const SizedBox(height: 12),
            _buildDoctorTags(),
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

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search, color: Colors.blue),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  Widget _buildMedicalChecks() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Medical Checks!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Check your health condition regularly to minimize the incidence of diseases.",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 12),
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
                  child: const Text("Check Now"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildDoctorSpecialityHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Doctor Speciality",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See All", style: TextStyle(color: Colors.blue, fontSize: 14)),
      ],
    );
  }

  Widget _buildSpecialityGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: const [
        _SpecialityItem(icon: Icons.local_hospital, label: "General"),
        _SpecialityItem(icon: Icons.medical_services, label: "Dentist"),
        _SpecialityItem(icon: Icons.remove_red_eye, label: "Ophthalm."),
        _SpecialityItem(icon: Icons.fastfood, label: "Nutrition"),
        _SpecialityItem(icon: Icons.psychology, label: "Neuro"),
        _SpecialityItem(icon: Icons.child_care, label: "Pediatric"),
        _SpecialityItem(icon: Icons.science, label: "Radiology"),
        _SpecialityItem(icon: Icons.more_horiz, label: "More"),
      ],
    );
  }

  Widget _buildTopDoctorsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Top Doctors",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See All", style: TextStyle(color: Colors.blue, fontSize: 14)),
      ],
    );
  }

  Widget _buildDoctorTags() {
    return Wrap(
      spacing: 8,
      children: [
        _tags("All", selected: true),
        _tags("General"),
        _tags("Dentist"),
        _tags("Nutritionist"),
      ],
    );
  }
}

class _SpecialityItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SpecialityItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

Widget _tags(String text, {bool selected = false}) {
  return ChoiceChip(
    label: Text(text),
    selected: selected,
    backgroundColor: Colors.transparent,
    selectedColor: Colors.transparent,
    labelStyle: TextStyle(
      color: selected ? Colors.blue : Colors.black,
      fontWeight: selected ? FontWeight.bold : FontWeight.normal,
    ),
    onSelected: (_) {},
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: Colors.blue, width: 2),
    ),
  );
}
