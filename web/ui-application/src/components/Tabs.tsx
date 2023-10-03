"use client"

import { useState } from "react"

interface TabsProps {
  className?: string,
  tabs: Array<{
    title: string,
    description?: string
    node: React.ReactNode
  }>
}

export default function Tabs({ tabs, className }: TabsProps) {
  const [currentTab, setCurrentTab] = useState(0);

  return (
    <div className={[className].join(" ")}>
      <div className="flex">
        {tabs.map((tab, index) => (
          <button type="button" className={["flex flex-col text-left px-4 py-2 border-b hover:border-orange-400", (currentTab == index) ? "border-orange-400" : "border-transparent"].join(" ")} key={index} onClick={() => setCurrentTab(index)}>
            <span className="font-medium">{tab.title}</span>
            <p className="text-gray-600 text-xs font-light">{tab.description}</p>
          </button>
        ))}
      </div>

      {tabs.map((tab, index) => (
        <div className={(index !== currentTab) ? "hidden" : undefined} key={index}>{tab.node}</div>
      ))}
    </div>
  )
}