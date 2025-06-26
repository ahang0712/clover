; ModuleID = 'svp_simple_030_001-opt.bc'
source_filename = "./svp_simple_030_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_030_001_gloable_var = common global i32 0, align 4
@svp_simple_030_001_isr_1_flag = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @svp_simple_030_001_main() #0 !dbg !7 {
  call void (...) @init() #2, !dbg !10
  call void @disable_isr(i32 -1), !dbg !13
  call void @enable_isr(i32 1), !dbg !14
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !15, !tbaa !16
  %2 = icmp sgt i32 %1, 12, !dbg !20
  br i1 %2, label %3, label %4, !dbg !15

3:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !21, !tbaa !16
  br label %4, !dbg !22

4:                                                ; preds = %3, %0
  ret i32 0, !dbg !23
}

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_init() #0 !dbg !11 {
  call void (...) @init(), !dbg !24
  ret void, !dbg !25
}

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @addData() #0 !dbg !26 {
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !27, !tbaa !16
  %2 = add nsw i32 %1, 1, !dbg !27
  store volatile i32 %2, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !27, !tbaa !16
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_isr_1() #0 !dbg !29 {
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !30, !tbaa !16
  %2 = add nsw i32 %1, 1, !dbg !30
  store volatile i32 %2, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !30, !tbaa !16
  store volatile i32 0, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !32, !tbaa !16
  call void @enable_isr(i32 2), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_isr_2() #0 !dbg !35 {
  %1 = load volatile i32, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !36, !tbaa !16
  %2 = icmp ne i32 %1, 0, !dbg !36
  br i1 %2, label %3, label %6, !dbg !36

3:                                                ; preds = %0
  %4 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !37, !tbaa !16
  %5 = add nsw i32 %4, 1, !dbg !37
  store volatile i32 %5, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !37, !tbaa !16
  br label %6, !dbg !38

6:                                                ; preds = %3, %0
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_isr_3() #0 !dbg !40 {
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !41, !tbaa !16
  %2 = add nsw i32 %1, 1, !dbg !41
  store volatile i32 %2, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !41, !tbaa !16
  ret void, !dbg !42
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_030_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_030")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_030_001_main", scope: !8, file: !8, line: 9, type: !9, scopeLine: 9, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_030_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_030")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 24, column: 3, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_030_001_init", scope: !8, file: !8, line: 20, type: !9, scopeLine: 20, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 10, column: 3, scope: !7)
!13 = !DILocation(line: 12, column: 3, scope: !7)
!14 = !DILocation(line: 13, column: 3, scope: !7)
!15 = !DILocation(line: 14, column: 7, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 14, column: 38, scope: !7)
!21 = !DILocation(line: 15, column: 36, scope: !7)
!22 = !DILocation(line: 16, column: 3, scope: !7)
!23 = !DILocation(line: 17, column: 3, scope: !7)
!24 = !DILocation(line: 24, column: 3, scope: !11)
!25 = !DILocation(line: 25, column: 1, scope: !11)
!26 = distinct !DISubprogram(name: "addData", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 28, column: 33, scope: !26)
!28 = !DILocation(line: 29, column: 1, scope: !26)
!29 = distinct !DISubprogram(name: "svp_simple_030_001_isr_1", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 28, column: 33, scope: !26, inlinedAt: !31)
!31 = distinct !DILocation(line: 31, column: 3, scope: !29)
!32 = !DILocation(line: 32, column: 33, scope: !29)
!33 = !DILocation(line: 33, column: 3, scope: !29)
!34 = !DILocation(line: 34, column: 1, scope: !29)
!35 = distinct !DISubprogram(name: "svp_simple_030_001_isr_2", scope: !8, file: !8, line: 35, type: !9, scopeLine: 35, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 36, column: 7, scope: !35)
!37 = !DILocation(line: 37, column: 35, scope: !35)
!38 = !DILocation(line: 38, column: 3, scope: !35)
!39 = !DILocation(line: 39, column: 1, scope: !35)
!40 = distinct !DISubprogram(name: "svp_simple_030_001_isr_3", scope: !8, file: !8, line: 40, type: !9, scopeLine: 40, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 41, column: 33, scope: !40)
!42 = !DILocation(line: 42, column: 1, scope: !40)
