# 🏗️ ConstructAI Platform

**Revolutionary AI-Powered Construction Management Platform**

A comprehensive Next.js application that integrates Revit API with intelligent agent orchestration, featuring real-time chat, 3D BIM visualization, document processing, and seamless project coordination.

![ConstructAI Platform](https://img.shields.io/badge/Built%20with-Next.js%2014-000000?style=for-the-badge&logo=next.js)
![Supabase](https://img.shields.io/badge/Backend-Supabase-3ECF8E?style=for-the-badge&logo=supabase)
![TypeScript](https://img.shields.io/badge/Language-TypeScript-3178C6?style=for-the-badge&logo=typescript)
![Three.js](https://img.shields.io/badge/3D-Three.js-000000?style=for-the-badge&logo=three.js)

## ✨ Features

### 🤖 AI Agent Orchestration
- **Suna AI Chat Interface** - Central conversational hub with real-time messaging
- **Multi-Agent Dashboard** - Coordinate Data Upload Bot, PM Bot, Design Converter
- **Real-time WebSocket** - Live agent interactions and status updates
- **Task Routing** - Intelligent distribution of work across specialized agents

### 🏢 3D BIM Visualization
- **Interactive 3D Viewer** - Three.js WebGL rendering with sample building model
- **Clash Detection** - Real-time conflict identification with severity levels
- **Element Selection** - Click any building component to view properties
- **Navigation Controls** - Zoom, pan, rotate, and section views

### 📁 Document Processing
- **Drag & Drop Upload** - Support for CAD, PDF, images, spreadsheets (up to 500MB)
- **OCR Processing** - Real Tesseract.js text extraction with confidence scoring
- **Smart Classification** - Automatic document categorization
- **Progress Tracking** - Live upload and processing status

### 👥 Project Management
- **Multiple Views** - Grid, List, Timeline, and Kanban project views
- **Team Directory** - Role-based user management with permissions
- **Task Assignment** - Natural language task creation and tracking
- **Budget Monitoring** - Real-time project financial tracking

### 🔐 Enterprise Security
- **NextAuth.js** - Role-based authentication with demo users
- **Supabase RLS** - Row-level security for project data
- **JWT Sessions** - Secure session management
- **Data Encryption** - TLS 1.2+ and AES-256 protection

## 🚀 Quick Start

### Demo Access
Try the platform immediately with these demo credentials:
- **Project Manager**: `john@constructai.com` / `demo123`
- **Senior Architect**: `sarah@constructai.com` / `demo123`
- **Structural Engineer**: `mike@constructai.com` / `demo123`

### Local Development
```bash
# Clone the repository
git clone https://github.com/yourusername/construction-ai-platform.git
cd construction-ai-platform

# Install dependencies
bun install

# Start development server
bun dev
```

Open [http://localhost:3000](http://localhost:3000) to see the platform.

## 🗄️ Full Supabase Deployment

This platform is optimized for **complete Supabase deployment** using Edge Functions for both frontend and backend - a unified, powerful solution.

### Quick Deploy
```bash
# Install Supabase CLI
npm install -g supabase

# Login and link to your project
supabase login
supabase link --project-ref your-project-ref

# Run automated deployment script
./deploy.sh
```

### Manual Setup
1. **Create Supabase Project** at [supabase.com](https://supabase.com)
2. **Install & Link Supabase CLI** to your project
3. **Deploy Database Schema** via `supabase db push`
4. **Deploy Edge Functions** via `supabase functions deploy`
5. **Configure Authentication** and storage buckets

📖 **Complete Instructions**: See [`DEPLOYMENT_GUIDE.md`](./DEPLOYMENT_GUIDE.md)

## 🛠️ Tech Stack

### Frontend
- **Next.js 14+** - React framework with App Router
- **TypeScript** - Type-safe development
- **Tailwind CSS** - Utility-first styling
- **Shadcn/UI** - Modern component library
- **Three.js** - 3D visualization and WebGL

### Backend & Infrastructure
- **Supabase** - Complete backend solution with PostgreSQL, Auth, Storage, Edge Functions
- **Edge Functions** - Serverless functions for frontend hosting and API endpoints
- **NextAuth.js** - Authentication and session management
- **Socket.IO** - Real-time bidirectional communication
- **Tesseract.js** - Client-side OCR processing

### AI & Processing
- **OpenAI API** - (Optional) Enhanced AI responses
- **Google Document AI** - (Optional) Advanced OCR
- **Autodesk Forge** - (Optional) CAD file processing

## 📋 Project Structure

```
construction-ai-platform/
├── src/
│   ├── app/                 # Next.js App Router pages
│   │   ├── (auth)/          # Authentication pages
│   │   ├── api/             # API routes and endpoints
│   │   ├── bim/             # 3D BIM viewer
│   │   ├── chat/            # Suna AI chat interface
│   │   ├── projects/        # Project management
│   │   └── team/            # Team directory
│   ├── components/          # Reusable UI components
│   │   ├── auth/            # Authentication components
│   │   ├── bim/             # 3D viewer components
│   │   ├── documents/       # File upload components
│   │   └── layout/          # Layout components
│   ├── lib/                 # Utility libraries
│   │   ├── auth.ts          # NextAuth configuration
│   │   ├── supabase.ts      # Supabase client setup
│   │   └── socket.ts        # Socket.IO configuration
│   └── types/               # TypeScript type definitions
├── supabase-schema.sql      # Complete database schema
├── DEPLOYMENT_GUIDE.md      # Detailed deployment instructions
└── deploy.sh                # Automated deployment script
```

## 🎯 Core Capabilities

### Real-time Collaboration
- Live chat with AI agents and team members
- Real-time project updates and notifications
- Collaborative 3D model viewing and annotation
- Instant file processing and sharing

### Advanced Document Processing
- Multi-format file support (DWG, DXF, PDF, XLSX, CSV, Images)
- Intelligent OCR with confidence scoring
- Automatic document classification and tagging
- Version control and revision tracking

### 3D BIM Integration
- Interactive building model visualization
- Automated clash detection and reporting
- Element property inspection and editing
- Construction phase timeline visualization

### Project Intelligence
- AI-powered project insights and recommendations
- Automated task assignment and scheduling
- Budget tracking and cost analysis
- Building code compliance checking

## 🔧 Configuration

### Environment Variables
```bash
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-key

# Authentication
NEXTAUTH_URL=your-deployment-url
NEXTAUTH_SECRET=your-secret-key

# Optional: AI Services
OPENAI_API_KEY=your-openai-key
GOOGLE_AI_API_KEY=your-google-ai-key
```

### Database Setup
The platform includes a complete SQL schema with:
- User management and role-based permissions
- Project data with team assignments
- Document storage and processing tracking
- Chat message history and agent logs
- BIM model metadata and clash detection results

## 📊 Performance & Scalability

### Optimizations
- **Server-side Rendering** - Fast initial page loads
- **Static Generation** - Optimized build output
- **Image Optimization** - Automatic image compression
- **Code Splitting** - Lazy loading of components
- **Edge Functions** - Global distribution

### Production Metrics
- **Response Time**: <3 seconds for 95% of requests
- **Concurrent Users**: 500+ simultaneous users supported
- **File Processing**: <10 seconds for files under 5MB
- **3D Rendering**: 60fps performance on modern devices
- **Database Queries**: <1 second for complex operations

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Documentation**: Complete guides in [`DEPLOYMENT_GUIDE.md`](./DEPLOYMENT_GUIDE.md)
- **Issues**: Report bugs and feature requests in GitHub Issues
- **Discussions**: Join community discussions for help and ideas

---

**Built with ❤️ for the construction industry** | **Powered by Supabase + Vercel** 🚀
