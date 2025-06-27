; ModuleID = 'svp_simple_019_001-opt.bc'
source_filename = "./svp_simple_019_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_019_001_global_condition1 = global i32 1, align 4
@svp_simple_019_001_global_condiiton2 = global i32 1, align 4
@svp_simple_019_001_global_condition3 = global i32 1, align 4
@svp_simple_019_001_global_para1 = common global i32 0, align 4
@svp_simple_019_001_global_para2 = common global i32 0, align 4
@svp_simple_019_001_global_para3 = common global i32 0, align 4
@svp_simple_019_001_global_var2 = common global i32 0, align 4
@svp_simple_019_001_global_var1 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  %1 = call i32 (...) @rand(), !dbg !11
  %2 = srem i32 %1, 10, !dbg !12
  store volatile i32 %2, i32* @svp_simple_019_001_global_para1, align 4, !dbg !13, !tbaa !14
  %3 = call i32 (...) @rand(), !dbg !18
  %4 = srem i32 %3, 10, !dbg !19
  store volatile i32 %4, i32* @svp_simple_019_001_global_para2, align 4, !dbg !20, !tbaa !14
  %5 = call i32 (...) @rand(), !dbg !21
  %6 = srem i32 %5, 10, !dbg !22
  store volatile i32 %6, i32* @svp_simple_019_001_global_para3, align 4, !dbg !23, !tbaa !14
  %7 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !24, !tbaa !14
  %8 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !25, !tbaa !14
  %9 = add nsw i32 %7, %8, !dbg !26
  %10 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !27, !tbaa !14
  %11 = icmp sgt i32 %9, %10, !dbg !28
  br i1 %11, label %12, label %14, !dbg !29

12:                                               ; preds = %0
  %13 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !30, !tbaa !14
  br label %14, !dbg !31

14:                                               ; preds = %12, %0
  %15 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !32, !tbaa !14
  %16 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !33, !tbaa !14
  %17 = icmp eq i32 %16, 1, !dbg !34
  br i1 %17, label %18, label %23, !dbg !35

18:                                               ; preds = %14
  %19 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !36, !tbaa !14
  %20 = icmp eq i32 %19, 1, !dbg !37
  br i1 %20, label %21, label %23, !dbg !38

21:                                               ; preds = %18
  %22 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !39, !tbaa !14
  br label %23, !dbg !40

23:                                               ; preds = %21, %18, %14
  call void (...) @idlerun(), !dbg !41
  call void @disable_isr(i32 1), !dbg !42
  %24 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !43, !tbaa !14
  %25 = icmp eq i32 %24, 1, !dbg !44
  br i1 %25, label %26, label %31, !dbg !45

26:                                               ; preds = %23
  %27 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !46, !tbaa !14
  %28 = icmp eq i32 %27, 1, !dbg !47
  br i1 %28, label %29, label %31, !dbg !48

29:                                               ; preds = %26
  %30 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !49, !tbaa !14
  br label %31, !dbg !50

31:                                               ; preds = %29, %26, %23
  call void @enable_isr(i32 1), !dbg !51
  call void (...) @idlerun(), !dbg !52
  call void @disable_isr(i32 1), !dbg !53
  %32 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !54, !tbaa !14
  %33 = icmp eq i32 %32, 1, !dbg !55
  br i1 %33, label %34, label %39, !dbg !56

34:                                               ; preds = %31
  %35 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !57, !tbaa !14
  %36 = icmp eq i32 %35, 0, !dbg !58
  br i1 %36, label %37, label %39, !dbg !59

37:                                               ; preds = %34
  %38 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !60, !tbaa !14
  br label %39, !dbg !61

39:                                               ; preds = %37, %34, %31
  call void @enable_isr(i32 1), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare void @init(...) #2

declare i32 @rand(...) #2

declare void @idlerun(...) #2

declare void @disable_isr(i32) #2

declare void @enable_isr(i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_isr_1() #0 !dbg !64 {
  call void (...) @idlerun(), !dbg !65
  %1 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !66, !tbaa !14
  %2 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !67, !tbaa !14
  %3 = add nsw i32 %1, %2, !dbg !68
  %4 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !69, !tbaa !14
  %5 = icmp slt i32 %3, %4, !dbg !70
  br i1 %5, label %6, label %7, !dbg !71

6:                                                ; preds = %0
  store volatile i32 85, i32* @svp_simple_019_001_global_var2, align 4, !dbg !72, !tbaa !14
  br label %7, !dbg !73

7:                                                ; preds = %6, %0
  store volatile i32 0, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !74, !tbaa !14
  store volatile i32 1, i32* @svp_simple_019_001_global_var1, align 4, !dbg !75, !tbaa !14
  ret void, !dbg !76
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_019")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_019_001_main", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_019")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 17, column: 3, scope: !7)
!11 = !DILocation(line: 18, column: 37, scope: !7)
!12 = !DILocation(line: 18, column: 44, scope: !7)
!13 = !DILocation(line: 18, column: 35, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 19, column: 37, scope: !7)
!19 = !DILocation(line: 19, column: 44, scope: !7)
!20 = !DILocation(line: 19, column: 35, scope: !7)
!21 = !DILocation(line: 20, column: 37, scope: !7)
!22 = !DILocation(line: 20, column: 44, scope: !7)
!23 = !DILocation(line: 20, column: 35, scope: !7)
!24 = !DILocation(line: 23, column: 8, scope: !7)
!25 = !DILocation(line: 23, column: 42, scope: !7)
!26 = !DILocation(line: 23, column: 40, scope: !7)
!27 = !DILocation(line: 23, column: 77, scope: !7)
!28 = !DILocation(line: 23, column: 75, scope: !7)
!29 = !DILocation(line: 23, column: 7, scope: !7)
!30 = !DILocation(line: 24, column: 15, scope: !7)
!31 = !DILocation(line: 24, column: 5, scope: !7)
!32 = !DILocation(line: 26, column: 13, scope: !7)
!33 = !DILocation(line: 28, column: 8, scope: !7)
!34 = !DILocation(line: 28, column: 45, scope: !7)
!35 = !DILocation(line: 28, column: 51, scope: !7)
!36 = !DILocation(line: 28, column: 55, scope: !7)
!37 = !DILocation(line: 28, column: 92, scope: !7)
!38 = !DILocation(line: 28, column: 7, scope: !7)
!39 = !DILocation(line: 29, column: 15, scope: !7)
!40 = !DILocation(line: 29, column: 5, scope: !7)
!41 = !DILocation(line: 30, column: 3, scope: !7)
!42 = !DILocation(line: 31, column: 3, scope: !7)
!43 = !DILocation(line: 32, column: 8, scope: !7)
!44 = !DILocation(line: 32, column: 45, scope: !7)
!45 = !DILocation(line: 32, column: 51, scope: !7)
!46 = !DILocation(line: 32, column: 55, scope: !7)
!47 = !DILocation(line: 32, column: 92, scope: !7)
!48 = !DILocation(line: 32, column: 7, scope: !7)
!49 = !DILocation(line: 33, column: 15, scope: !7)
!50 = !DILocation(line: 33, column: 5, scope: !7)
!51 = !DILocation(line: 34, column: 3, scope: !7)
!52 = !DILocation(line: 35, column: 3, scope: !7)
!53 = !DILocation(line: 36, column: 3, scope: !7)
!54 = !DILocation(line: 37, column: 8, scope: !7)
!55 = !DILocation(line: 37, column: 45, scope: !7)
!56 = !DILocation(line: 37, column: 51, scope: !7)
!57 = !DILocation(line: 37, column: 55, scope: !7)
!58 = !DILocation(line: 37, column: 92, scope: !7)
!59 = !DILocation(line: 37, column: 7, scope: !7)
!60 = !DILocation(line: 38, column: 15, scope: !7)
!61 = !DILocation(line: 38, column: 5, scope: !7)
!62 = !DILocation(line: 39, column: 3, scope: !7)
!63 = !DILocation(line: 40, column: 1, scope: !7)
!64 = distinct !DISubprogram(name: "svp_simple_019_001_isr_1", scope: !8, file: !8, line: 42, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 43, column: 3, scope: !64)
!66 = !DILocation(line: 44, column: 8, scope: !64)
!67 = !DILocation(line: 44, column: 42, scope: !64)
!68 = !DILocation(line: 44, column: 40, scope: !64)
!69 = !DILocation(line: 44, column: 77, scope: !64)
!70 = !DILocation(line: 44, column: 75, scope: !64)
!71 = !DILocation(line: 44, column: 7, scope: !64)
!72 = !DILocation(line: 45, column: 36, scope: !64)
!73 = !DILocation(line: 45, column: 5, scope: !64)
!74 = !DILocation(line: 47, column: 40, scope: !64)
!75 = !DILocation(line: 49, column: 34, scope: !64)
!76 = !DILocation(line: 50, column: 1, scope: !64)
