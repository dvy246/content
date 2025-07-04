# Divy Yadav Portfolio Site

## Overview

This is a React + Vite + TypeScript portfolio website for Divy Yadav, an AI Professional & Business Strategist. The site features a modern, responsive design with dynamic content management capabilities through Supabase integration. The architecture supports both public viewing and admin editing modes, allowing for real-time content updates without requiring code deployments.

## System Architecture

### Frontend Architecture
- **Framework**: React 18 with TypeScript for type safety
- **Build Tool**: Vite for fast development and optimized builds
- **Styling**: Tailwind CSS with custom color palette (navy, platinum, gold)
- **Animation**: Framer Motion for smooth transitions and interactions
- **Routing**: React Router DOM for client-side navigation
- **State Management**: React Context API for admin mode management
- **Form Handling**: React Hook Form for efficient form management
- **Notifications**: React Hot Toast for user feedback

### Backend Architecture
- **Database**: Supabase PostgreSQL for content persistence
- **Authentication**: Supabase Auth (planned for future admin access control)
- **API Layer**: Supabase client for database operations
- **Storage**: Supabase Storage (planned for future image/video uploads)

### Key Design Decisions
1. **Content Management**: Chose a simple `sections` table structure for flexible content editing
2. **Admin Mode**: Implemented toggle-based admin interface for in-place editing
3. **TypeScript Integration**: Full TypeScript support with proper Vite environment types
4. **Component Architecture**: Modular, reusable components with clear separation of concerns

## Key Components

### Core Components
- `EditableContent`: Main component for dynamic content display/editing
- `AdminProvider`: Context provider for admin mode state management
- Portfolio sections: About, Projects, Experience, Contact

### Custom Hooks
- `useContent(name: string)`: Manages content fetching and saving operations
- Returns: `{ content, saveContent, isLoading, error }`

### Utility Files
- `lib/supabase.ts`: Supabase client configuration and initialization
- `types/`: TypeScript type definitions for content and admin states

## Data Flow

### Content Loading Flow
1. Component mounts and calls `useContent(sectionName)`
2. Hook fetches content from Supabase `sections` table
3. Content is displayed in read-only or editable mode based on admin state
4. Loading and error states are handled gracefully

### Content Saving Flow
1. Admin enables edit mode through AdminProvider
2. User modifies content in EditableContent component
3. Changes are saved via `saveContent` function
4. Supabase `upsert` operation persists changes
5. UI updates reflect saved state with success/error feedback

### Database Schema
```sql
sections table:
- id: UUID (primary key)
- name: text (unique, e.g., "about", "projects")
- content: text (the actual content)
```

## External Dependencies

### Production Dependencies
- **@supabase/supabase-js**: Database and auth client
- **framer-motion**: Animation library
- **lucide-react**: Icon library
- **react-hook-form**: Form management
- **react-hot-toast**: Toast notifications
- **react-router-dom**: Client-side routing

### Development Dependencies
- **@vitejs/plugin-react**: Vite React plugin
- **tailwindcss**: Utility-first CSS framework
- **typescript**: Type checking and compilation
- **eslint**: Code linting and formatting

## Deployment Strategy

### Environment Configuration
- Supabase URL and API key configured via environment variables
- Vite environment variables with proper TypeScript support
- Production builds optimized for performance

### Build Process
1. TypeScript compilation with strict type checking
2. Vite build optimization with code splitting
3. Static asset optimization and caching
4. Tailwind CSS purging for minimal bundle size

### Future Enhancements (Planned)
- Version history tracking for content edits
- Draft/Publish workflow for content changes
- Image/video support using Supabase Storage
- Row Level Security (RLS) for admin access control
- Content import/export functionality in JSON format

## Changelog

```
Changelog:
- July 04, 2025. Initial setup
- July 04, 2025. Complete Supabase integration implemented with:
  * Supabase client configuration (src/lib/supabase.ts)
  * Custom useContent hook for content management
  * AdminProvider context for admin state management
  * EditableContent component for in-place editing
  * AdminPanel component with toggle functionality
  * Complete TypeScript support with proper types
  * Database schema with sections table
  * Real-time content persistence
  * Toast notifications for user feedback
  * Keyboard shortcuts (Ctrl+Enter to save, Escape to cancel)
  * Responsive design with hover states
  * Error handling and loading states
```

## User Preferences

```
Preferred communication style: Simple, everyday language.
```

### Development Notes
- All UI and styling preserved from original design
- Modular file organization following React best practices
- Clean TypeScript implementation with proper type safety
- Error handling and loading states implemented throughout
- Admin mode toggle functionality for seamless content management