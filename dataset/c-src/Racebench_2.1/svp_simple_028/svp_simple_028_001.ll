; ModuleID = 'svp_simple_028_001.bc'
source_filename = "./svp_simple_028_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_028_001_gloable_var = common global i32 0, align 4
@svp_simple_028_001_isr_1_flag = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @svp_simple_028_001_main() #0 !dbg !7 {
  call void @svp_simple_028_001_init(), !dbg !10
  call void @disable_isr(i32 -1), !dbg !11
  call void @enable_isr(i32 1), !dbg !12
  %1 = load volatile i32, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !13, !tbaa !14
  %2 = icmp sgt i32 %1, 12, !dbg !18
  br i1 %2, label %3, label %4, !dbg !13

3:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !19, !tbaa !14
  br label %4, !dbg !20

4:                                                ; preds = %3, %0
  ret i32 0, !dbg !21
}

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_init() #0 !dbg !22 {
  call void (...) @init(), !dbg !23
  ret void, !dbg !24
}

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_isr_1() #0 !dbg !25 {
  %1 = load volatile i32, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !26, !tbaa !14
  %2 = add nsw i32 %1, 1, !dbg !26
  store volatile i32 %2, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !26, !tbaa !14
  store volatile i32 0, i32* @svp_simple_028_001_isr_1_flag, align 4, !dbg !27, !tbaa !14
  call void @enable_isr(i32 2), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_isr_2() #0 !dbg !30 {
  %1 = load volatile i32, i32* @svp_simple_028_001_isr_1_flag, align 4, !dbg !31, !tbaa !14
  %2 = icmp ne i32 %1, 0, !dbg !31
  br i1 %2, label %3, label %6, !dbg !31

3:                                                ; preds = %0
  %4 = load volatile i32, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !32, !tbaa !14
  %5 = add nsw i32 %4, 2, !dbg !32
  store volatile i32 %5, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !32, !tbaa !14
  br label %6, !dbg !33

6:                                                ; preds = %3, %0
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_isr_3() #0 !dbg !35 {
  %1 = load volatile i32, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !36, !tbaa !14
  %2 = add nsw i32 %1, 3, !dbg !36
  store volatile i32 %2, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !36, !tbaa !14
  ret void, !dbg !37
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_028_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_028")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_028_001_main", scope: !8, file: !8, line: 9, type: !9, scopeLine: 9, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_028_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_028")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 10, column: 3, scope: !7)
!11 = !DILocation(line: 12, column: 3, scope: !7)
!12 = !DILocation(line: 13, column: 3, scope: !7)
!13 = !DILocation(line: 14, column: 7, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 14, column: 38, scope: !7)
!19 = !DILocation(line: 15, column: 36, scope: !7)
!20 = !DILocation(line: 16, column: 3, scope: !7)
!21 = !DILocation(line: 17, column: 3, scope: !7)
!22 = distinct !DISubprogram(name: "svp_simple_028_001_init", scope: !8, file: !8, line: 20, type: !9, scopeLine: 20, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 24, column: 3, scope: !22)
!24 = !DILocation(line: 25, column: 1, scope: !22)
!25 = distinct !DISubprogram(name: "svp_simple_028_001_isr_1", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!26 = !DILocation(line: 28, column: 33, scope: !25)
!27 = !DILocation(line: 29, column: 33, scope: !25)
!28 = !DILocation(line: 30, column: 3, scope: !25)
!29 = !DILocation(line: 31, column: 1, scope: !25)
!30 = distinct !DISubprogram(name: "svp_simple_028_001_isr_2", scope: !8, file: !8, line: 32, type: !9, scopeLine: 32, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 33, column: 7, scope: !30)
!32 = !DILocation(line: 34, column: 36, scope: !30)
!33 = !DILocation(line: 35, column: 3, scope: !30)
!34 = !DILocation(line: 36, column: 1, scope: !30)
!35 = distinct !DISubprogram(name: "svp_simple_028_001_isr_3", scope: !8, file: !8, line: 37, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 38, column: 34, scope: !35)
!37 = !DILocation(line: 39, column: 1, scope: !35)
