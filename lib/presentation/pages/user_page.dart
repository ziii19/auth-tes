import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../../domain/entities/user_detail.dart';
import 'login_page.dart';

class UserPage extends StatelessWidget {
  final UserDetail userDetail;

  const UserPage({super.key, required this.userDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Implementasi logout
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header dengan foto dan nama
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userDetail.image),
                  radius: 50,
                ),
                const SizedBox(height: 16),
                Text(
                  '${userDetail.firstName} ${userDetail.lastName}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  userDetail.email,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
              ],
            ),
            _buildDivider(),
            // Informasi Pribadi
            _buildSectionTitle('Personal Information'),
            _buildInfoTile('Username', userDetail.username, icon: Icons.person),
            _buildInfoTile('Gender', userDetail.gender, icon: Icons.wc),
            _buildInfoTile('Age', userDetail.age.toString(), icon: Icons.cake),
            _buildInfoTile('Blood Group', userDetail.bloodGroup,
                icon: Icons.bloodtype),
            _buildInfoTile('Height', '${userDetail.height} cm',
                icon: Icons.height),
            _buildInfoTile('Weight', '${userDetail.weight} kg',
                icon: Icons.monitor_weight),
            _buildInfoTile('Eye Color', userDetail.eyeColor,
                icon: Icons.remove_red_eye),
            _buildInfoTile(
                'Hair', '${userDetail.hair.color}, ${userDetail.hair.type}',
                icon: Icons.hail_rounded),
            _buildInfoTile('Birth Date', userDetail.birthDate,
                icon: Icons.calendar_today),
            _buildDivider(),
            // Kontak
            _buildSectionTitle('Contact Information'),
            _buildInfoTile('Phone', userDetail.phone, icon: Icons.phone),
            _buildInfoTile(
              'Address',
              '${userDetail.address.address}, ${userDetail.address.city}, ${userDetail.address.state}, ${userDetail.address.postalCode}',
              icon: Icons.home,
            ),
            _buildInfoTile('IP Address', userDetail.ip, icon: Icons.public),
            _buildDivider(),
            // Pendidikan dan Pekerjaan
            _buildSectionTitle('Education & Work'),
            _buildInfoTile('University', userDetail.university,
                icon: Icons.school),
            _buildInfoTile('Company',
                '${userDetail.company.name} - ${userDetail.company.department}',
                icon: Icons.business),
            _buildInfoTile('Title', userDetail.company.title, icon: Icons.work),
            _buildInfoTile('EIN', userDetail.ein, icon: Icons.account_balance),
            _buildInfoTile('SSN', userDetail.ssn, icon: Icons.security),
            _buildDivider(),
            // Keuangan
            _buildSectionTitle('Financial Information'),
            _buildInfoTile(
              'Bank',
              '${userDetail.bank.cardType} **** **** **** ${userDetail.bank.cardNumber.substring(userDetail.bank.cardNumber.length - 4)}',
              icon: Icons.account_balance_wallet,
            ),
            _buildInfoTile('Currency', userDetail.bank.currency,
                icon: Icons.monetization_on),
            _buildInfoTile('IBAN', userDetail.bank.iban,
                icon: Icons.account_balance),
            _buildDivider(),
            // Crypto
            _buildSectionTitle('Crypto Information'),
            _buildInfoTile('Coin', userDetail.crypto.coin,
                icon: Icons.currency_bitcoin),
            _buildInfoTile('Wallet', userDetail.crypto.wallet,
                icon: Icons.wallet_giftcard),
            _buildInfoTile('Network', userDetail.crypto.network,
                icon: Icons.network_check),
            _buildDivider(),
            // Role
            _buildSectionTitle('Role'),
            _buildInfoTile('Role', userDetail.role,
                icon: Icons.admin_panel_settings),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.blue) : null,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(thickness: 1);
  }
}
