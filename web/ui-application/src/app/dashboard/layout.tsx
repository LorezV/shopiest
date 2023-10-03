import { BiSolidDashboard, BiLogoProductHunt, BiSearch } from "react-icons/bi";

interface DashboardLayoutProps {
    children: React.ReactNode
}

export default function DashboardLayout({ children }: DashboardLayoutProps) {
    return (
        <div className="h-screen flex overflow-hidden bg-neutral-100">
            <aside className="flex flex-col border-r bg-white">
                <div className="flex flex-col">
                    <a className="flex items-center gap-x-2 px-5 py-2 text-gray-600 hover:bg-orange-400 hover:text-white" href="/dashboard">
                        <BiSolidDashboard></BiSolidDashboard>Dashboard
                    </a>

                    <a className="flex items-center gap-x-2 px-5 py-2 text-gray-600 hover:bg-orange-400 hover:text-white" href="/dashboard/product/create">
                        <BiLogoProductHunt></BiLogoProductHunt>Product
                    </a>
                </div>
            </aside>

            <div className="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden">
                <header className="border-b sticky top-0 z-999 flex w-full bg-white">
                    <div className="px-4 py-2">
                        <div className="flex items-center gap-x-2">
                            <span className="text-2xl"><BiSearch /></span>
                            <input type="text" className="outline-none text-gray-600 py-4" />
                        </div>
                    </div>
                </header>

                <main className="flex-1">
                    {children}
                </main>

                <footer className="p-5 flex items-center justify-between bg-white text-gray-400">
                    <span>{(new Date()).getFullYear()} © Wellby.</span>
                    <span>Design & Develop by Dmitriy Derkach</span>
                </footer>
            </div>
        </div>
    )
}