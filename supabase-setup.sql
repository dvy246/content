-- Create the sections table
CREATE TABLE IF NOT EXISTS sections (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  content TEXT NOT NULL DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create an index on the name column for faster queries
CREATE INDEX IF NOT EXISTS idx_sections_name ON sections(name);

-- Enable Row Level Security (RLS) 
ALTER TABLE sections ENABLE ROW LEVEL SECURITY;

-- Create policies for public access (you can restrict this later)
CREATE POLICY "Allow public read access" ON sections
  FOR SELECT TO public
  USING (true);

CREATE POLICY "Allow public write access" ON sections
  FOR ALL TO public
  USING (true);

-- Create a function to automatically update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Create a trigger to automatically update updated_at
DROP TRIGGER IF EXISTS update_sections_updated_at ON sections;
CREATE TRIGGER update_sections_updated_at
  BEFORE UPDATE ON sections
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Insert some sample data (optional)
INSERT INTO sections (name, content) VALUES 
  ('hero-title', 'Divy Yadav'),
  ('hero-subtitle', 'AI Professional & Business Strategist'),
  ('hero-description', 'From Commerce to Code: How Business Acumen Meets AI Mastery. Blending analytical precision with business intuition — solving AI challenges with real-world impact.'),
  ('about-title', 'About Me'),
  ('about-content', 'I''m a dedicated AI professional with a unique background that bridges the gap between business strategy and technical innovation. My journey from commerce to code has equipped me with a rare combination of analytical thinking and practical business acumen that I bring to every AI project.'),
  ('experience-title', 'Experience'),
  ('experience-content', 'My professional journey spans across business development, strategic planning, and AI implementation. I specialize in translating complex business requirements into effective AI solutions, ensuring that technology serves real business objectives.'),
  ('skills-title', 'Skills & Expertise'),
  ('skills-content', '• Machine Learning & AI Development
• Business Intelligence & Analytics
• Strategic Planning & Consulting
• Data Science & Visualization
• Project Management
• Cross-functional Team Leadership'),
  ('contact-title', 'Get In Touch'),
  ('contact-content', 'Ready to discuss how AI can transform your business? I''m always open to exploring new opportunities and collaborations. Let''s connect and create something amazing together.')
ON CONFLICT (name) DO NOTHING;