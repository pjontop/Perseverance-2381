# Team Perseverance - VEX Robotics Management App

A comprehensive team management application for VEX Robotics teams, built with Flutter and Appwrite backend.

## Features

- **Complete Authentication System** - Email/password and OAuth (Google, Apple)
- **Real-time Team Collaboration** - Live updates across all team members
- **Task Management** - Assign, track, and complete team tasks
- **Build Documentation** - Document robot iterations with photos
- **Inventory Management** - Track parts, quantities, and locations
- **Competition Scouting** - Live match data entry and analysis
- **Meeting Scheduler** - Schedule and track team meetings
- **Analytics Dashboard** - Performance insights and team productivity
- **Offline Support** - Local caching with sync capabilities

## Field Lengths (Best Practices)

Below are the recommended maximum lengths for each field in the Appwrite collections. These are based on Appwrite defaults and common best practices for production systems.

### Users Collection
| Field        | Type     | Max Length | Notes                |
|--------------|----------|------------|----------------------|
| userId       | string   | 36         | UUID, required       |
| fullName     | string   | 64         | required             |
| email        | string   | 64         | required, unique     |
| role         | string   | 16         | enum, required       |
| teamId       | string   | 36         | optional, UUID       |
| photoUrl     | string   | 2048       | optional, URL        |
| createdAt    | datetime | ISO 8601   | required             |
| lastActive   | datetime | ISO 8601   | optional             |

### Teams Collection
| Field      | Type     | Max Length | Notes                |
|------------|----------|------------|----------------------|
| name       | string   | 64         | required             |
| code       | string   | 16         | required, unique     |
| ownerId    | string   | 36         | required, UUID       |
| members    | string[] | 100        | array of userIds     |
| settings   | string   | 1024       | optional, JSON       |
| createdAt  | datetime | ISO 8601   | required             |

### Tasks Collection
| Field        | Type     | Max Length | Notes                |
|--------------|----------|------------|----------------------|
| title        | string   | 64         | required             |
| description  | string   | 512        | optional             |
| assignedTo   | string   | 36         | optional, userId     |
| teamId       | string   | 36         | required, UUID       |
| status       | string   | 16         | enum, required       |
| priority     | string   | 16         | enum, required       |
| dueDate      | datetime | ISO 8601   | optional             |
| createdBy    | string   | 36         | required, userId     |
| createdAt    | datetime | ISO 8601   | required             |
| completedAt  | datetime | ISO 8601   | optional             |

### Build Logs Collection
| Field        | Type     | Max Length | Notes                |
|--------------|----------|------------|----------------------|
| title        | string   | 64         | required             |
| description  | string   | 1024       | required             |
| teamId       | string   | 36         | required, UUID       |
| version      | string   | 16         | required             |
| photos       | string[] | 10         | array of fileIds     |
| createdBy    | string   | 36         | required, userId     |
| createdAt    | datetime | ISO 8601   | required             |

### Inventory Collection
| Field        | Type     | Max Length | Notes                |
|--------------|----------|------------|----------------------|
| name         | string   | 64         | required             |
| description  | string   | 256        | optional             |
| quantity     | int      | 32-bit     | required             |
| location     | string   | 64         | optional             |
| teamId       | string   | 36         | required, UUID       |
| category     | string   | 32         | required             |
| createdAt    | datetime | ISO 8601   | required             |
| updatedAt    | datetime | ISO 8601   | required             |

### Matches Collection
| Field         | Type     | Max Length | Notes                |
|---------------|----------|------------|----------------------|
| teamId        | string   | 36         | required, UUID       |
| competitionId | string   | 36         | required, UUID       |
| opponentTeam  | string   | 36         | required, teamId     |
| matchNumber   | string   | 16         | required             |
| alliance      | string   | 8          | enum, required       |
| score         | int      | 32-bit     | optional             |
| opponentScore | int      | 32-bit     | optional             |
| result        | string   | 8          | enum, required       |
| notes         | string   | 512        | optional             |
| scoutData     | string   | 2048       | optional, JSON       |
| matchDate     | datetime | ISO 8601   | required             |
| createdBy     | string   | 36         | required, userId     |

### Competitions Collection
| Field      | Type     | Max Length | Notes                |
|------------|----------|------------|----------------------|
| name       | string   | 64         | required             |
| location   | string   | 128        | required             |
| startDate  | datetime | ISO 8601   | required             |
| endDate    | datetime | ISO 8601   | required             |
| description| string   | 512        | optional             |
| teams      | string[] | 100        | array of teamIds     |
| createdAt  | datetime | ISO 8601   | required             |

### Tools Collection
| Field         | Type     | Max Length | Notes                |
|---------------|----------|------------|----------------------|
| name          | string   | 64         | required             |
| description   | string   | 256        | optional             |
| teamId        | string   | 36         | required, UUID       |
| isAvailable   | bool     |            | required             |
| checkedOutBy  | string   | 36         | optional, userId     |
| checkedOutAt  | datetime | ISO 8601   | optional             |
| createdAt     | datetime | ISO 8601   | required             |

### Meetings Collection
| Field        | Type     | Max Length | Notes                |
|--------------|----------|------------|----------------------|
| title        | string   | 64         | required             |
| description  | string   | 512        | optional             |
| teamId       | string   | 36         | required, UUID       |
| scheduledDate| datetime | ISO 8601   | required             |
| duration     | int      | 32-bit     | minutes              |
| location     | string   | 64         | optional             |
| attendees    | string[] | 100        | array of userIds     |
| notes        | string   | 1024       | optional             |
| createdBy    | string   | 36         | required, userId     |
| createdAt    | datetime | ISO 8601   | required             |

## Tech Stack

- **Frontend**: Flutter 3.4.4+
- **Backend**: Appwrite 17.0.1
- **State Management**: Riverpod
- **Database**: Appwrite Databases
- **Storage**: Appwrite Storage
- **Authentication**: Appwrite Auth + OAuth
- **Real-time**: Appwrite Realtime

## Prerequisites

- Flutter SDK 3.4.4 or higher
- Dart SDK 3.4.4 or higher
- Appwrite Cloud account or self-hosted instance
- Android Studio / VS Code
- Git

## Appwrite Setup

### 1. Create Appwrite Project

1. Go to [Appwrite Console](https://cloud.appwrite.io)
2. Create a new project named "Team Perseverance"
3. Note down your Project ID: `6874697700034c53cfecZ`

### 2. Create Database

1. Go to Databases in your Appwrite console
2. Create a new database named "perseverance_db"
3. Note down your Database ID

### 3. Create Collections

Run the following commands in your Appwrite console or use the Appwrite CLI:

#### Users Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId users \
  --name "Users" \
  --documentSecurity "document"
```

**Attributes:**
- `userId` (string, required)
- `fullName` (string, required)
- `email` (string, required)
- `role` (string, required, enum: Coach, Captain, Member)
- `teamId` (string, optional)
- `photoUrl` (string, optional)
- `createdAt` (datetime, required)
- `lastActive` (datetime, optional)

#### Teams Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId teams \
  --name "Teams" \
  --documentSecurity "document"
```

**Attributes:**
- `name` (string, required)
- `code` (string, required, unique)
- `ownerId` (string, required)
- `members` (string[], required)
- `settings` (string, optional, JSON)
- `createdAt` (datetime, required)

#### Tasks Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId tasks \
  --name "Tasks" \
  --documentSecurity "document"
```

**Attributes:**
- `title` (string, required)
- `description` (string, optional)
- `assignedTo` (string, optional)
- `teamId` (string, required)
- `status` (string, required, enum: Pending, In Progress, Completed)
- `priority` (string, required, enum: Low, Medium, High)
- `dueDate` (datetime, optional)
- `createdBy` (string, required)
- `createdAt` (datetime, required)
- `completedAt` (datetime, optional)

#### Build Logs Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId buildLogs \
  --name "Build Logs" \
  --documentSecurity "document"
```

**Attributes:**
- `title` (string, required)
- `description` (string, required)
- `teamId` (string, required)
- `version` (string, required)
- `photos` (string[], optional)
- `createdBy` (string, required)
- `createdAt` (datetime, required)

#### Inventory Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId inventory \
  --name "Inventory" \
  --documentSecurity "document"
```

**Attributes:**
- `name` (string, required)
- `description` (string, optional)
- `quantity` (integer, required)
- `location` (string, optional)
- `teamId` (string, required)
- `category` (string, required)
- `createdAt` (datetime, required)
- `updatedAt` (datetime, required)

#### Matches Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId matches \
  --name "Matches" \
  --documentSecurity "document"
```

**Attributes:**
- `teamId` (string, required)
- `competitionId` (string, required)
- `opponentTeam` (string, required)
- `matchNumber` (string, required)
- `alliance` (string, required, enum: Red, Blue)
- `score` (integer, optional)
- `opponentScore` (integer, optional)
- `result` (string, required, enum: Win, Loss, Tie)
- `notes` (string, optional)
- `scoutData` (string, optional, JSON)
- `matchDate` (datetime, required)
- `createdBy` (string, required)

#### Competitions Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId competitions \
  --name "Competitions" \
  --documentSecurity "document"
```

**Attributes:**
- `name` (string, required)
- `location` (string, required)
- `startDate` (datetime, required)
- `endDate` (datetime, required)
- `description` (string, optional)
- `teams` (string[], optional)
- `createdAt` (datetime, required)

#### Tools Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId tools \
  --name "Tools" \
  --documentSecurity "document"
```

**Attributes:**
- `name` (string, required)
- `description` (string, optional)
- `teamId` (string, required)
- `isAvailable` (boolean, required)
- `checkedOutBy` (string, optional)
- `checkedOutAt` (datetime, optional)
- `createdAt` (datetime, required)

#### Meetings Collection
```bash
appwrite databases createCollection \
  --databaseId YOUR_DATABASE_ID \
  --collectionId meetings \
  --name "Meetings" \
  --documentSecurity "document"
```

**Attributes:**
- `title` (string, required)
- `description` (string, optional)
- `teamId` (string, required)
- `scheduledDate` (datetime, required)
- `duration` (integer, required, minutes)
- `location` (string, optional)
- `attendees` (string[], optional)
- `notes` (string, optional)
- `createdBy` (string, required)
- `createdAt` (datetime, required)

### 4. Create Storage Buckets

Create the following storage buckets:

1. **profile-photos** - For user profile pictures
2. **build-photos** - For build log documentation
3. **competition-photos** - For competition photos
4. **documents** - For general team documents

### 5. Configure Authentication

1. Go to Auth > Settings in your Appwrite console
2. Enable Email/Password authentication
3. Configure OAuth providers (Google, Apple)
4. Set up email templates for verification and password reset

### 6. Set Up Permissions

Configure the following permissions for each collection:

**Users Collection:**
- Create: Authenticated users
- Read: Team members
- Update: Own profile or team admin
- Delete: Team admin only

**Teams Collection:**
- Create: Authenticated users
- Read: Team members
- Update: Team owner or admin
- Delete: Team owner only

**Tasks Collection:**
- Create: Team members
- Read: Team members
- Update: Assigned user or team admin
- Delete: Team admin only

**Build Logs Collection:**
- Create: Team members
- Read: Team members
- Update: Creator or team admin
- Delete: Creator or team admin

**Inventory Collection:**
- Create: Team members
- Read: Team members
- Update: Team members
- Delete: Team admin only

**Matches Collection:**
- Create: Team members
- Read: Team members
- Update: Creator or team admin
- Delete: Team admin only

**Competitions Collection:**
- Create: Team members
- Read: Team members
- Update: Team admin
- Delete: Team admin only

**Tools Collection:**
- Create: Team members
- Read: Team members
- Update: Team members
- Delete: Team admin only

**Meetings Collection:**
- Create: Team members
- Read: Team members
- Update: Creator or team admin
- Delete: Creator or team admin

## Environment Configuration

### 1. Create Environment File

Create `lib/config/appwrite_config.dart`:

```dart
class AppwriteConfig {
  static const String endpoint = 'https://cloud.appwrite.io/v1';
  static const String projectId = '6874697700034c53cfecZ';
  static const String databaseId = 'YOUR_DATABASE_ID';
  
  // Storage bucket IDs
  static const String profilePhotosBucket = 'profile-photos';
  static const String buildPhotosBucket = 'build-photos';
  static const String competitionPhotosBucket = 'competition-photos';
  static const String documentsBucket = 'documents';
}
```

### 2. Update Services

Update the following files with your actual Appwrite configuration:

- `lib/services/auth_service.dart`
- `lib/services/database_service.dart`
- `lib/services/storage_service.dart`

Replace the placeholder values:
- `your-project-id` → Your actual Project ID
- `your-database-id` → Your actual Database ID

## Installation

### 1. Clone Repository

```bash
git clone https://github.com/your-username/perseverance.git
cd perseverance
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

```bash
flutter packages pub run build_runner build
```

### 4. Configure Appwrite

Update the configuration files with your Appwrite credentials as described above.

### 5. Run the App

```bash
flutter run
```

## Database Schema

### Relationships

- **Users** → **Teams** (Many-to-One)
- **Teams** → **Tasks** (One-to-Many)
- **Teams** → **Build Logs** (One-to-Many)
- **Teams** → **Inventory** (One-to-Many)
- **Teams** → **Matches** (One-to-Many)
- **Teams** → **Tools** (One-to-Many)
- **Teams** → **Meetings** (One-to-Many)
- **Competitions** → **Matches** (One-to-Many)

### Indexes

Create the following indexes for optimal performance:

**Users Collection:**
- `teamId` (ASC)
- `email` (ASC, unique)

**Teams Collection:**
- `code` (ASC, unique)
- `ownerId` (ASC)

**Tasks Collection:**
- `teamId` (ASC)
- `assignedTo` (ASC)
- `status` (ASC)
- `dueDate` (ASC)

**Build Logs Collection:**
- `teamId` (ASC)
- `createdAt` (DESC)

**Inventory Collection:**
- `teamId` (ASC)
- `category` (ASC)
- `name` (ASC)

**Matches Collection:**
- `teamId` (ASC)
- `competitionId` (ASC)
- `matchDate` (DESC)

**Competitions Collection:**
- `startDate` (ASC)
- `endDate` (ASC)

**Tools Collection:**
- `teamId` (ASC)
- `isAvailable` (ASC)

**Meetings Collection:**
- `teamId` (ASC)
- `scheduledDate` (ASC)

## Deployment

### Android

1. **Build APK:**
```bash
flutter build apk --release
```

2. **Build App Bundle:**
```bash
flutter build appbundle --release
```

3. **Sign the App:**
   - Create a keystore file
   - Configure signing in `android/app/build.gradle.kts`
   - Add keystore properties to `android/key.properties`

### iOS

1. **Build for iOS:**
```bash
flutter build ios --release
```

2. **Archive in Xcode:**
   - Open `ios/Runner.xcworkspace`
   - Select Product → Archive
   - Upload to App Store Connect

### Web

```bash
flutter build web --release
```

## Testing

### Unit Tests

```bash
flutter test
```

### Integration Tests

```bash
flutter test integration_test/
```

### Widget Tests

```bash
flutter test test/widget_test.dart
```

## Production Checklist

- [ ] Update Appwrite configuration with production credentials
- [ ] Configure OAuth providers (Google, Apple)
- [ ] Set up email templates
- [ ] Configure storage bucket permissions
- [ ] Set up database indexes
- [ ] Test authentication flow
- [ ] Test real-time features
- [ ] Test offline functionality
- [ ] Configure push notifications
- [ ] Set up error monitoring
- [ ] Test on multiple devices
- [ ] Performance optimization
- [ ] Security audit

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, email support@perseverance.com or create an issue in the repository.

## Changelog

### v1.0.0
- Initial release
- Complete authentication system
- Team management features
- Real-time collaboration
- Build documentation
- Competition scouting
- Analytics dashboard
