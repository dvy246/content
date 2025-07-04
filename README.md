# Divy Yadav Portfolio - Supabase Integration

This is a React + Vite + TypeScript portfolio website with Supabase database integration for content management through an admin panel.

## 🚀 Features

- **Editable Content**: All text content can be edited through the admin panel
- **Database Persistence**: Content changes are saved to Supabase and persist across page reloads
- **Admin Mode**: Toggle between view and edit modes
- **Real-time Updates**: Content updates immediately after saving
- **TypeScript Support**: Full type safety throughout the application

## 🛠️ Tech Stack

- **Frontend**: React 18, TypeScript, Vite
- **Styling**: Tailwind CSS with custom color palette
- **Database**: Supabase PostgreSQL
- **Animation**: Framer Motion
- **Icons**: Lucide React
- **Forms**: React Hook Form
- **Notifications**: React Hot Toast

## 📁 Project Structure

```
src/
├── components/
│   ├── EditableContent.tsx    # Main component for editable content
│   └── AdminPanel.tsx         # Admin panel for toggling edit mode
├── contexts/
│   └── AdminContext.tsx       # React context for admin state
├── hooks/
│   └── useContent.ts          # Custom hook for content management
├── lib/
│   └── supabase.ts           # Supabase client configuration
├── pages/
│   └── HomePage.tsx          # Main portfolio page
├── App.tsx                   # Main app component
└── main.tsx                  # Entry point
```

## 🗃️ Database Setup

1. **Go to your Supabase project dashboard**
2. **Navigate to SQL Editor**
3. **Run the setup script** from `supabase-setup.sql`:

```sql
-- Create the sections table
CREATE TABLE IF NOT EXISTS sections (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  content TEXT NOT NULL DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create an index for faster queries
CREATE INDEX IF NOT EXISTS idx_sections_name ON sections(name);

-- Enable Row Level Security
ALTER TABLE sections ENABLE ROW LEVEL SECURITY;

-- Create policies for public access
CREATE POLICY "Allow public read access" ON sections
  FOR SELECT TO public USING (true);

CREATE POLICY "Allow public write access" ON sections
  FOR ALL TO public USING (true);
```

## 🎯 How to Use

### Admin Mode

1. **Enable Admin Mode**: Click the "Admin Panel" button in the bottom-right corner
2. **Enter Admin Mode**: Click "Enter Admin Mode" to activate editing
3. **Edit Content**: Hover over any content to see the edit button
4. **Save Changes**: Use Ctrl+Enter to save or click the Save button
5. **Cancel Changes**: Press Escape or click Cancel to discard changes

### Keyboard Shortcuts

- **Ctrl+Enter**: Save changes
- **Escape**: Cancel editing

### Content Sections

All content is organized by section names:
- `hero-title`: Main title
- `hero-subtitle`: Subtitle
- `hero-description`: Hero description
- `about-title`: About section title
- `about-content`: About section content
- `experience-title`: Experience section title
- `experience-content`: Experience section content
- `skills-title`: Skills section title
- `skills-content`: Skills section content
- `contact-title`: Contact section title
- `contact-content`: Contact section content

## 🔧 Development

### Environment Variables

Make sure your `.env` file contains:

```env
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### Starting the Development Server

```bash
npx vite --host 0.0.0.0 --port 5173
```

### Building for Production

```bash
npm run build
```

## 🎨 Customization

### Adding New Editable Sections

1. Use the `EditableContent` component:

```tsx
<EditableContent
  sectionName="your-section-name"
  defaultContent="Default content here"
  multiline={true} // or false for single line
  className="your-css-classes"
/>
```

2. The content will automatically be saved to the database with the section name as the key.

### Styling

The project uses Tailwind CSS with custom colors:
- **Navy**: Primary color scheme
- **Platinum**: Secondary/neutral colors
- **Gold**: Accent colors

## 📄 License

This project is private and proprietary to Divy Yadav.

## 🤝 Contributing

This is a personal portfolio project. For questions or suggestions, please contact Divy Yadav directly.