interface AuthorizationLayoutProps {
  children: React.ReactNode
}

export default function AuthorizationLayout({ children }: AuthorizationLayoutProps) {
  return (
    <main className="h-screen relative">
      <div className="mx-auto max-w-xl">
        <div className="py-16">
          {children}
        </div>
      </div>
    </main>
  )
}