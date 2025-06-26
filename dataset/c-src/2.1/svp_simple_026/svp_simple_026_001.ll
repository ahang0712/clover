; ModuleID = 'svp_simple_026_001.bc'
source_filename = "./svp_simple_026_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_026_001_gloable_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_026_001_main() #0 !dbg !7 {
  call void @svp_simple_026_001_init(), !dbg !10
  call void @disable_isr(i32 1), !dbg !11
  %1 = load volatile i32, i32* @svp_simple_026_001_gloable_var, align 4, !dbg !12, !tbaa !13
  %2 = icmp sgt i32 %1, 12, !dbg !17
  br i1 %2, label %3, label %4, !dbg !12

3:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_026_001_gloable_var, align 4, !dbg !18, !tbaa !13
  br label %4, !dbg !19

4:                                                ; preds = %3, %0
  call void @enable_isr(i32 1), !dbg !20
  ret void, !dbg !21
}

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_026_001_init() #0 !dbg !22 {
  call void @disable_isr(i32 -1), !dbg !23
  call void (...) @init(), !dbg !24
  call void @enable_isr(i32 -1), !dbg !25
  ret void, !dbg !26
}

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_026_001_isr_1() #0 !dbg !27 {
  %1 = load volatile i32, i32* @svp_simple_026_001_gloable_var, align 4, !dbg !28, !tbaa !13
  %2 = add nsw i32 %1, 1, !dbg !28
  store volatile i32 %2, i32* @svp_simple_026_001_gloable_var, align 4, !dbg !28, !tbaa !13
  ret void, !dbg !29
}

; Function Attrs: nounwind uwtable
define void @svp_simple_026_001_isr_2() #0 !dbg !30 {
  %1 = load volatile i32, i32* @svp_simple_026_001_gloable_var, align 4, !dbg !31, !tbaa !13
  %2 = add nsw i32 %1, -1, !dbg !31
  store volatile i32 %2, i32* @svp_simple_026_001_gloable_var, align 4, !dbg !31, !tbaa !13
  ret void, !dbg !32
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_026_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_026")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_026_001_main", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_026_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_026")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 8, column: 3, scope: !7)
!11 = !DILocation(line: 10, column: 3, scope: !7)
!12 = !DILocation(line: 11, column: 7, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 11, column: 38, scope: !7)
!18 = !DILocation(line: 12, column: 36, scope: !7)
!19 = !DILocation(line: 13, column: 3, scope: !7)
!20 = !DILocation(line: 14, column: 3, scope: !7)
!21 = !DILocation(line: 16, column: 3, scope: !7)
!22 = distinct !DISubprogram(name: "svp_simple_026_001_init", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 19, column: 3, scope: !22)
!24 = !DILocation(line: 21, column: 3, scope: !22)
!25 = !DILocation(line: 22, column: 3, scope: !22)
!26 = !DILocation(line: 23, column: 1, scope: !22)
!27 = distinct !DISubprogram(name: "svp_simple_026_001_isr_1", scope: !8, file: !8, line: 24, type: !9, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = !DILocation(line: 25, column: 33, scope: !27)
!29 = !DILocation(line: 26, column: 1, scope: !27)
!30 = distinct !DISubprogram(name: "svp_simple_026_001_isr_2", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 28, column: 33, scope: !30)
!32 = !DILocation(line: 29, column: 1, scope: !30)
