TCAPracticeApp: A SwiftUI app demonstrating Composable Architecture (TCA) with modern navigation using @Presents.

Features:
- Fetch and display posts from a postClient.
- Navigate to Post Detail view.
- Navigate to Settings view.
- Delete all posts from settings.
- Automatic navigation pop when deleting posts.
- Loading and error states for fetching posts.

Architecture:
- PostsFeature: Main feature managing posts and navigation.
- Path / Destination: Uses @Presents to handle navigation instead of StackState.
- PostDetailFeature: Displays detailed post info.
- SettingsFeature: Provides options such as "Delete All Posts".

Navigation:
- @Presents var destination: Destination.State? replaces StackState.
- Use PresentationAction.dismiss to move back automatically.
- Supports multiple destination types (postDetail, settings).

How It Works:
- PostsView observes PostsFeature.State using WithViewStore.
- Load Posts button fetches posts asynchronously.
- Tap on a post → opens PostDetailView.
- Tap on settings → opens SettingsView.
- Delete All Posts → clears posts and automatically pops back.
