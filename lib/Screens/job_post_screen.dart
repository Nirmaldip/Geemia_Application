// import 'package:flutter/material.dart';
//
// class JobPostScreen extends StatelessWidget {
//   const JobPostScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final borderStyle = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
//     );
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         centerTitle: true,
//         title: const Text(
//           'Job Post',
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Job Title
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: 'Job title',
//                 labelStyle: TextStyle(color: Colors.grey),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             TextField(
//               maxLines: 5,
//               decoration: InputDecoration(
//                 labelText: 'Describe your need',
//                 labelStyle: const TextStyle(color: Colors.grey),
//                 alignLabelWithHint: true,
//                 border: borderStyle,
//                 contentPadding: const EdgeInsets.all(12),
//                 helperText: '0/4000 Characters',
//                 helperStyle: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.orange),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               alignment: Alignment.center,
//               child: const Text(
//                 "Drag or upload need images not more than 10mb",
//                 style: TextStyle(color: Colors.orange),
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             const Text(
//               'How would you like to pay the service provider?',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 12),
//
//             // Radio Options
//             Row(
//               children: [
//                 Expanded(
//                   child: RadioListTile(
//                     contentPadding: EdgeInsets.zero,
//                     title: const Text('Fixed rate'),
//                     value: 'fixed',
//                     groupValue: 'fixed',
//                     onChanged: (val) {},
//                   ),
//                 ),
//                 Expanded(
//                   child: RadioListTile(
//                     contentPadding: EdgeInsets.zero,
//                     title: const Text('Hourly rate'),
//                     value: 'hourly',
//                     groupValue: '',
//                     onChanged: (val) {},
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//
//             // Pricing Input
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: 'Pricing',
//                 labelStyle: TextStyle(color: Colors.grey),
//                 prefixText: '₦',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             // Location Inputs (State + Location)
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'State',
//                       prefixIcon: const Icon(Icons.location_city),
//                       border: borderStyle,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Location',
//                       prefixIcon: const Icon(Icons.location_on),
//                       border: borderStyle,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 32),
//
//             // Post Job Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   backgroundColor: const Color(0xFFFF8A00),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text(
//                   'Post Job',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:geemia_app/model/job_model.dart';
import 'package:geemia_app/retrofit/api_client.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({super.key});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  String _jobType = "fixed";
  int? _categoryId; // now dynamic
  bool _loading = false;

  List<Map<String, dynamic>> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // List<Map<String, dynamic>> _categories = [];
  // int? _categoryId;

  Future<void> _fetchCategories() async {
    try {
      final dio = Dio();
      final client = ApiClient(dio);

      final cats = await client.getCategories();
      setState(() {
        _categories = cats.cast<Map<String, dynamic>>(); // cast explicitly
        if (_categories.isNotEmpty) {
          _categoryId = _categories.first["id"]; // access with ["id"]
        }
      });
    } catch (e) {
      debugPrint("Failed to fetch categories: $e");
    }
  }



  Future<void> _postJob() async {
    if (_categoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a category")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      final dio = Dio();
      final client = ApiClient(dio);

      final job = Job(
        categoryId: _categoryId!,
        title: _titleController.text,
        description: _descController.text,
        location: _locationController.text,
        company: _companyController.text,
        type: _jobType,
        salary: int.tryParse(_salaryController.text) ?? 0,
      );

      final response = await client.postJob(job);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Job posted successfully: ${response.title}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed: $e")),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Job Post',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Dropdown
            DropdownButtonFormField<int>(
              value: _categoryId,
              items: _categories
                  .map((cat) => DropdownMenuItem<int>(
                value: cat["id"],
                child: Text(cat["name"] ?? "Unknown"),
              ))
                  .toList(),
              onChanged: (val) => setState(() => _categoryId = val),
              decoration: const InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Job Title
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Job title',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _descController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Describe your need',
                labelStyle: const TextStyle(color: Colors.grey),
                alignLabelWithHint: true,
                border: borderStyle,
                contentPadding: const EdgeInsets.all(12),
                helperText: '0/4000 Characters',
                helperStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _companyController,
              decoration: const InputDecoration(
                labelText: 'Company',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'How would you like to pay the service provider?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            // Radio Options -> Maps to `type`
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Fixed rate'),
                    value: 'fixed',
                    groupValue: _jobType,
                    onChanged: (val) {
                      setState(() => _jobType = val.toString());
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Hourly rate'),
                    value: 'hourly',
                    groupValue: _jobType,
                    onChanged: (val) {
                      setState(() => _jobType = val.toString());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Salary',
                labelStyle: TextStyle(color: Colors.grey),
                prefixText: '₦',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                prefixIcon: const Icon(Icons.location_on),
                border: borderStyle,
              ),
            ),
            const SizedBox(height: 32),

            // Post Job Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _postJob,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFFFF8A00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Post Job',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

