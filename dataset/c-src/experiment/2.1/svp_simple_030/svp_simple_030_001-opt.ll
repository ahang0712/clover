; ModuleID = 'svp_simple_030_001-opt.bc'
source_filename = "./svp_simple_030_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_030_001_gloable_var = common global i32 0, align 4
@svp_simple_030_001_isr_1_flag = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @svp_simple_030_001_main() #0 !dbg !7 {
  %1 = call i32 (...) @rand() #2, !dbg !10
  store volatile i32 %1, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !13, !tbaa !14
  %2 = call i32 (...) @rand() #2, !dbg !18
  store volatile i32 %2, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !19, !tbaa !14
  call void (...) @init() #2, !dbg !20
  call void @disable_isr(i32 -1), !dbg !21
  call void @enable_isr(i32 1), !dbg !22
  %3 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !23, !tbaa !14
  %4 = icmp sgt i32 %3, 12, !dbg !24
  br i1 %4, label %5, label %6, !dbg !23

5:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !25, !tbaa !14
  br label %6, !dbg !26

6:                                                ; preds = %5, %0
  ret i32 0, !dbg !27
}

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_init() #0 !dbg !11 {
  %1 = call i32 (...) @rand(), !dbg !28
  store volatile i32 %1, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !29, !tbaa !14
  %2 = call i32 (...) @rand(), !dbg !30
  store volatile i32 %2, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !31, !tbaa !14
  call void (...) @init(), !dbg !32
  ret void, !dbg !33
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @addData() #0 !dbg !34 {
  store volatile i32 12, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !35, !tbaa !14
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_isr_1() #0 !dbg !37 {
  store volatile i32 12, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !38, !tbaa !14
  store volatile i32 0, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !40, !tbaa !14
  call void @enable_isr(i32 2), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_isr_2() #0 !dbg !43 {
  %1 = load volatile i32, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !44, !tbaa !14
  %2 = icmp ne i32 %1, 0, !dbg !44
  br i1 %2, label %3, label %6, !dbg !44

3:                                                ; preds = %0
  %4 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !45, !tbaa !14
  %5 = add nsw i32 %4, 1, !dbg !45
  store volatile i32 %5, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !45, !tbaa !14
  br label %6, !dbg !46

6:                                                ; preds = %3, %0
  ret void, !dbg !47
}

; Function Attrs: nounwind uwtable
define void @svp_simple_030_001_isr_3() #0 !dbg !48 {
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !49, !tbaa !14
  %2 = add nsw i32 %1, 1, !dbg !49
  store volatile i32 %2, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !49, !tbaa !14
  ret void, !dbg !50
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_030_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_030")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_030_001_main", scope: !8, file: !8, line: 24, type: !9, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_030_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_030")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 36, column: 36, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_030_001_init", scope: !8, file: !8, line: 35, type: !9, scopeLine: 35, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 25, column: 3, scope: !7)
!13 = !DILocation(line: 36, column: 34, scope: !11, inlinedAt: !12)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 37, column: 35, scope: !11, inlinedAt: !12)
!19 = !DILocation(line: 37, column: 33, scope: !11, inlinedAt: !12)
!20 = !DILocation(line: 39, column: 3, scope: !11, inlinedAt: !12)
!21 = !DILocation(line: 27, column: 3, scope: !7)
!22 = !DILocation(line: 28, column: 3, scope: !7)
!23 = !DILocation(line: 29, column: 7, scope: !7)
!24 = !DILocation(line: 29, column: 38, scope: !7)
!25 = !DILocation(line: 30, column: 36, scope: !7)
!26 = !DILocation(line: 31, column: 3, scope: !7)
!27 = !DILocation(line: 32, column: 3, scope: !7)
!28 = !DILocation(line: 36, column: 36, scope: !11)
!29 = !DILocation(line: 36, column: 34, scope: !11)
!30 = !DILocation(line: 37, column: 35, scope: !11)
!31 = !DILocation(line: 37, column: 33, scope: !11)
!32 = !DILocation(line: 39, column: 3, scope: !11)
!33 = !DILocation(line: 40, column: 1, scope: !11)
!34 = distinct !DISubprogram(name: "addData", scope: !8, file: !8, line: 42, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 43, column: 34, scope: !34)
!36 = !DILocation(line: 44, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "svp_simple_030_001_isr_1", scope: !8, file: !8, line: 45, type: !9, scopeLine: 45, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 43, column: 34, scope: !34, inlinedAt: !39)
!39 = distinct !DILocation(line: 46, column: 3, scope: !37)
!40 = !DILocation(line: 47, column: 33, scope: !37)
!41 = !DILocation(line: 48, column: 3, scope: !37)
!42 = !DILocation(line: 49, column: 1, scope: !37)
!43 = distinct !DISubprogram(name: "svp_simple_030_001_isr_2", scope: !8, file: !8, line: 50, type: !9, scopeLine: 50, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 51, column: 7, scope: !43)
!45 = !DILocation(line: 52, column: 35, scope: !43)
!46 = !DILocation(line: 53, column: 3, scope: !43)
!47 = !DILocation(line: 54, column: 1, scope: !43)
!48 = distinct !DISubprogram(name: "svp_simple_030_001_isr_3", scope: !8, file: !8, line: 55, type: !9, scopeLine: 55, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 56, column: 33, scope: !48)
!50 = !DILocation(line: 57, column: 1, scope: !48)
